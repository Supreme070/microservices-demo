provider "aws" {
  region = var.region
}

provider "kubernetes" {
  host                   = aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster_auth.token
}

data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.eks_cluster.name
}

data "aws_eks_cluster_auth" "cluster_auth" {
  name = aws_eks_cluster.eks_cluster.name
}

resource "aws_iam_role" "eks_cluster" {
  name = "eks_cluster"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = { Service = "eks.amazonaws.com" },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

resource "aws_iam_role_policy_attachment" "eks_cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks_cluster.name
}

resource "aws_security_group" "eks_cluster" {
  name        = "eks_cluster-sg"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.project-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "project_cluster"
  }
}

resource "aws_security_group_rule" "project_cluster-ingress-workstation-https" {
  cidr_blocks       = [var.workstation-external-cidr]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.eks_cluster.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-cluster"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.eks_cluster.id]
    subnet_ids         = aws_subnet.project-vpc[*].id 
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_cluster-AmazonEKSServicePolicy,
  ]
}

variable "microservices" {
  type = list(object({
    name     = string
    image    = string
    replicas = number
  }))
  default = [
    {
      name     = "adservice"
      image    = "thecodegirl/adservice:latest"
      replicas = 2
    },
    # ... [Other services as you have already provided]
  ]
}

resource "kubernetes_namespace" "microservices" {
  metadata {
    name = "microservices"
  }
}

resource "kubernetes_deployment" "microservices" {
  count = length(var.microservices)

  metadata {
    name      = var.microservices[count.index].name
    namespace = kubernetes_namespace.microservices.metadata[0].name
  }

  spec {
    replicas = var.microservices[count.index].replicas

    selector {
      match_labels = {
        app = var.microservices[count.index].name
      }
    }

    template {
      metadata {
        labels = {
          app = var.microservices[count.index].name
        }
      }

      spec {
        container {
          image = var.microservices[count.index].image
          name  = var.microservices[count.index].name
        }
      }
    }
  }
}

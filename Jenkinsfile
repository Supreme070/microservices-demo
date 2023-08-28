@Library('github.com/releaseworks/jenkinslib') _
pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'Supreme070:Badboy123'
        AWS_ACCESS_KEY_ID = 'AKIA5TCF5DW2CRGE5KPF'
        AWS_SECRET_ACCESS_KEY = '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'
        DOCKER_HUB_CREDENTIALS_USERNAME = 'Supreme070'
    }

    stages {
        stage('Build adservice and push to dockerhub') {
            steps {
                script {
                    checkout scm
                    sh "docker build -t Supreme070/adservice:${env.BUILD_ID} -f src/adservice/Dockerfile ."
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("Supreme070/adservice:${env.BUILD_ID}").push()
                        docker.image("Supreme070/adservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build cartservice and push to dockerhub') {
            steps {
                script {
                    checkout scm
                    sh "docker build -t Supreme070/cartservice:${env.BUILD_ID} -f src/cartservice/src/Dockerfile ."
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("Supreme070/cartservice:${env.BUILD_ID}").push()
                        docker.image("Supreme070/cartservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build checkoutservice and push to dockerhub') {
            steps {
                script {
                    checkout scm
                    sh "docker build -t Supreme070/checkoutservice:${env.BUILD_ID} -f src/checkoutservice/Dockerfile ."
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("Supreme070/checkoutservice:${env.BUILD_ID}").push()
                        docker.image("Supreme070/checkoutservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build currencyservice and push to dockerhub') {
            steps {
                script {
                    checkout scm
                    sh "docker build -t Supreme070/currencyservice:${env.BUILD_ID} -f src/currencyservice/Dockerfile ."
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("Supreme070/currencyservice:${env.BUILD_ID}").push()
                        docker.image("Supreme070/currencyservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build emailservice and push to dockerhub') {
            steps {
                script {
                    checkout scm
                    sh "docker build -t Supreme070/emailservice:${env.BUILD_ID} -f src/emailservice/Dockerfile ."
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("Supreme070/emailservice:${env.BUILD_ID}").push()
                        docker.image("Supreme070/emailservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build frontend and push to dockerhub') {
            steps {
                script {
                    checkout scm
                    sh "docker build -t Supreme070/frontend:${env.BUILD_ID} -f src/frontend/Dockerfile ."
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("Supreme070/frontend:${env.BUILD_ID}").push()
                        docker.image("Supreme070/frontend:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build loadgenerator and push to dockerhub') {
            steps {
                script {
                    checkout scm
                    sh "docker build -t Supreme070/loadgenerator:${env.BUILD_ID} -f src/loadgenerator/Dockerfile ."
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("Supreme070/loadgenerator:${env.BUILD_ID}").push()
                        docker.image("Supreme070/loadgenerator:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build paymentservice and push to dockerhub') {
            steps {
                script {
                    checkout scm
                    sh "docker build -t Supreme070/paymentservice:${env.BUILD_ID} -f src/paymentservice/Dockerfile ."
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("Supreme070/paymentservice:${env.BUILD_ID}").push()
                        docker.image("Supreme070/paymentservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build productcatalogservice and push to dockerhub') {
            steps {
                script {
                    checkout scm
                    sh "docker build -t Supreme070/productcatalogservice:${env.BUILD_ID} -f src/productcatalogservice/Dockerfile ."
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("Supreme070/productcatalogservice:${env.BUILD_ID}").push()
                        docker.image("Supreme070/productcatalogservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build recommendationservice and push to dockerhub') {
            steps {
                script {
                    checkout scm
                    sh "docker build -t Supreme070/recommendationservice:${env.BUILD_ID} -f src/recommendationservice/Dockerfile ."
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("Supreme070/recommendationservice:${env.BUILD_ID}").push()
                        docker.image("Supreme070/recommendationservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build shippingservice and push to dockerhub') {
            steps {
                script {
                    checkout scm
                    sh "docker build -t Supreme070/shippingservice:${env.BUILD_ID} -f src/shippingservice/Dockerfile ."
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("Supreme070/shippingservice:${env.BUILD_ID}").push()
                        docker.image("Supreme070/shippingservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Cleanup Local Docker Images') {
            steps {
                script {
                    def microservices = ['adservice', 'cartservice', 'checkoutservice', 'currencyservice', 'emailservice', 'frontend', 'loadgenerator', 'paymentservice', 'productcatalogservice', 'recommendationservice', 'shippingservice']
                    microservices.each { microserviceName ->
                        sh "docker rmi -f Supreme070/${microserviceName}:${env.BUILD_ID}"
                        sh "docker rmi -f Supreme070/${microserviceName}:latest"
                    }
                }
            }
        }

        stage('Deploy to Amazon EKS') {
            steps {
                script {
                    withCredentials([[
                        $class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                    ]]) {
                        sh "aws eks --region us-west-2 update-kubeconfig --name eks-cluster"
                        sh "kubectl apply -f /home/ubuntu/microservices-demo/release/kubernetes-manifests.yaml"
                    }
                }
            }
        }
    }
}

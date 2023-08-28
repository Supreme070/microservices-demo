pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'Supreme070:Badboy123'
        AWS_ACCESS_KEY_ID = 'AKIA5TCF5DW2CRGE5KPF'
        AWS_SECRET_ACCESS_KEY = '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'
        DOCKER_HUB_CREDENTIALS_USERNAME = 'Supreme070'
    }

    stages {
        stage('Build Images') {
            steps {
                script {
                    // Correcting paths for Docker builds. Assuming Dockerfiles and source files are in the repo's structure.
                    def basePath = './microservices-demo/src'
                    def dockerServices = ['adservice', 'cartservice/src', 'checkoutservice', 'currencyservice', 'emailservice', 'frontend', 'loadgenerator', 'paymentservice', 'productcatalogservice', 'recommendationservice', 'shippingservice']

                    for(service in dockerServices) {
                        def image = "thecodegirl/${service.split('/')[0]}:${env.BUILD_ID}"
                        docker.build("${image}", "${basePath}/${service}/Dockerfile .")

                        // Here, you'd typically use Jenkins's 'withCredentials' method to retrieve and use your Docker Hub credentials.
                        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
                            docker.image("${image}").push()
                            docker.image("${image}").push('latest')
                        }
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh "aws eks --region us-east-1 update-kubeconfig --name eks-cluster"  
                        sh "kubectl apply -f /var/lib/jenkins/kubernetes-manifests.yaml"
                    }
                }
            }
        }

        stage('Cleanup') {
            steps {
                sh "docker image prune -af"
            }
        }
    }
}

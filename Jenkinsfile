pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhubpass')
        AWS_ACCESS_KEY_ID = credentials('AKIAQJPRSKPXJJISHRDU')
        AWS_SECRET_ACCESS_KEY = credentials('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')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build and Push Docker Images') {
            steps {
                script {
                    // Build and push Docker images for each microservice
                    def microservices = ['adservice', 'cartservice', 'checkoutservice', 'currencyservice', 'emailservice', 'frontend', 'paymentservice', 'productcatalogservice', 'recommendationservice', 'shippingservice']
                    for (def service in microservices) {
                        docker.build("thecodegirl/${service}:${env.BUILD_NUMBER}")
                        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                            docker.image("thecodegirl/${service}:${env.BUILD_NUMBER}").push()
                        }
                    }
                }
            }
        }

        stage('Deploy to Kubernetes or EKS') {
            steps {
                script {
                    // Apply Kubernetes manifest files for each microservice
                    def microservices = ['adservice', 'cartservice', 'checkoutservice', 'currencyservice', 'emailservice', 'frontend', 'paymentservice', 'productcatalogservice', 'recommendationservice', 'shippingservice']
                    for (def service in microservices) {
                        sh "kubectl apply -f ~/microservices-demo/release/kubernetes-manifests.yaml/${service}/"
                    }
                }
            }
        }
    }
}
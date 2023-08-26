@Library('github.com/releaseworks/jenkinslib') _
pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'dockerid'
        AWS_ACCESS_KEY_ID = credentials('AWS_Access_Key')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_Secret_Key')
        DOCKER_HUB_CREDENTIALS_USERNAME = 'oduntanbola@gmail.com'
        //registry = "YourDockerhubAccount/YourRepository"
        //registryCredential = 'dockerhub_id'
        
    }
    stages {
        //stage('Login to Docker Hub') {
            //steps {
               // script {
                        //sh "echo ${DOCKER_HUB_CREDENTIALS} | docker login -u ${DOCKER_HUB_CREDENTIALS_USERNAME} --password-stdin"
                //}
            //}     	                      	  
        //}
        stage('Build adservice and push to dockerhub') {
            steps {
                script {
                    //build adservice
                    checkout scm
                    docker.build("thecodegirl/adservice:${env.BUILD_ID}", "-f /var/lib/jenkins/adservice/Dockerfile /var/lib/jenkins/adservice")
                    
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("thecodegirl/adservice:${env.BUILD_ID}").push()
                        docker.image("thecodegirl/adservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build cartservice and push to dockerhub') {
            steps {
                script {
                    //build adservice
                    checkout scm
                    docker.build("thecodegirl/cartservice:${env.BUILD_ID}", "-f /var/lib/jenkins/cartservice/src/Dockerfile /var/lib/jenkins/cartservice/src")

                    //push to docker hub
                    
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("thecodegirl/cartservice:${env.BUILD_ID}").push()
                        docker.image("thecodegirl/cartservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build checkoutservice and push to dockerhub') {
            steps {
                script {
                    //build adservice
                    checkout scm
                    docker.build("thecodegirl/checkoutservice:${env.BUILD_ID}", "-f /var/lib/jenkins/checkout/Dockerfile /var/lib/jenkins/checkout")

                    //push to docker hub
                    
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("thecodegirl/checkoutservice:${env.BUILD_ID}").push()
                        docker.image("thecodegirl/checkoutservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build currencyservice and push to dockerhub') {
            steps {
                script {
                    //build adservice
                    checkout scm
                    docker.build("thecodegirl/currencyservice:${env.BUILD_ID}", "-f /var/lib/jenkins/currency/Dockerfile /var/lib/jenkins/currency")

                    //push to docker hub
                    
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("thecodegirl/currencyservice:${env.BUILD_ID}").push()
                        docker.image("thecodegirl/currencyservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build emailservice and push to dockerhub') {
            steps {
                script {
                    //build adservice
                    checkout scm
                    docker.build("thecodegirl/emailservice:${env.BUILD_ID}", "-f /var/lib/jenkins/emailservice/Dockerfile /var/lib/jenkins/emailservice")

                    //push to docker hub
                    
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("thecodegirl/emailservice:${env.BUILD_ID}").push()
                        docker.image("thecodegirl/emailservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build frontend and push to dockerhub') {
            steps {
                script {
                    //build adservice
                    checkout scm
                    docker.build("thecodegirl/frontend:${env.BUILD_ID}", "-f /var/lib/jenkins/frontend/Dockerfile /var/lib/jenkins/frontend")

                    //push to docker hub
                    
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("thecodegirl/frontend:${env.BUILD_ID}").push()
                        docker.image("thecodegirl/frontend:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build loadgenerator and push to dockerhub') {
            steps {
                script {
                    //build adservice
                    checkout scm
                    docker.build("thecodegirl/loadgenerator:${env.BUILD_ID}", "-f /var/lib/jenkins/loadgenerator/Dockerfile /var/lib/jenkins/loadgenerator")

                    //push to docker hub
                    
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("thecodegirl/loadgenerator:${env.BUILD_ID}").push()
                        docker.image("thecodegirl/loadgenerator:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Build paymentservice and push to dockerhub') {
            steps {
                script {
                    //build adservice
                    checkout scm
                    docker.build("thecodegirl/paymentservice:${env.BUILD_ID}", "-f /var/lib/jenkins/paymentservice/Dockerfile /var/lib/jenkins/paymentservice")

                    //push to docker hub
                    
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("thecodegirl/paymentservice:${env.BUILD_ID}").push()
                        docker.image("thecodegirl/paymentservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }
        stage('Build productcatalogservice and push to dockerhub') {
            steps {
                script {
                    //build adservice
                    checkout scm
                    docker.build("thecodegirl/productcatalogservice:${env.BUILD_ID}", "-f /var/lib/jenkins/productcatalogservice/Dockerfile /var/lib/jenkins/productcatalogservice")

                    //push to docker hub
                    
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("thecodegirl/productcatalogservice:${env.BUILD_ID}").push()
                        docker.image("thecodegirl/productcatalogservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }
        stage('Build recommendationservice and push to dockerhub') {
            steps {
                script {
                    //build adservice
                    checkout scm
                    docker.build("thecodegirl/recommendationservice:${env.BUILD_ID}", "-f /var/lib/jenkins/recommendationservice/Dockerfile /var/lib/jenkins/recommendationservice")

                    //push to docker hub
                    
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("thecodegirl/recommendationservice:${env.BUILD_ID}").push()
                        docker.image("thecodegirl/recommendationservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }
        stage('Build shippingservice and push to dockerhub') {
            steps {
                script {
                    //build adservice
                    checkout scm
                    docker.build("thecodegirl/shippingservice:${env.BUILD_ID}", "-f /var/lib/jenkins/shippingservice/Dockerfile /var/lib/jenkins/shippingservice")

                    //push to docker hub
                    
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("thecodegirl/shippingservice:${env.BUILD_ID}").push()
                        docker.image("thecodegirl/shippingservice:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }
        stage('Cleanup Local Docker Images') {
            steps {
                script {
                    def microservices = ['adservice', 'cartservice', 'checkoutservice', 'currencyservice', 'emailservice', 'frontend', 'loadgenerator', 'paymentservice', 'productcatalogservice', 'recommendationservice', 'shippingservice' ]
                    microservices.each { microserviceName ->
                        sh "docker rmi -f thecodegirl/${microserviceName}:${env.BUILD_ID}"
                        sh "docker rmi -f thecodegirl/${microserviceName}:latest"
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
                        sh "aws eks --region us-east-1 update-kubeconfig --name eks-cluster"
                        sh "kubectl apply -f /var/lib/jenkins/kubernetes-manifests.yaml"
                    }
                }
            }
        }
        stage('Rollout Deployment') {
            steps {
                script {
                    //def microservices = ['adservice', 'cartservice', 'checkoutservice', 'currencyservice', 'emailservice', 'frontend', 'loadgenerator', 'paymentservice', 'productcatalogservice', 'recommendationservice', 'shippingservice']
                    //microservices.each { microserviceName ->
                    //def kubeDeploymentName = "${microserviceName}"
                    //def imageTag = "your_image_tag_here"

                    kubeConfig = readFile("${HOME}/.kube/config")
                    sh """
                    echo '$kubeConfig' > kubeconfig.yaml
                    kubectl set image deployment/adservice server=thecodegirl/adservice:${env.BUILD_ID}
                    kubectl set image deployment/cartservice server=thecodegirl/cartservice:${env.BUILD_ID}
                    kubectl set image deployment/checkoutservice server=thecodegirl/checkoutservice:${env.BUILD_ID}
                    kubectl set image deployment/currencyservice server=thecodegirl/currencyservice:${env.BUILD_ID}
                    kubectl set image deployment/emailservice server=thecodegirl/emailservice:${env.BUILD_ID}
                    kubectl set image deployment/frontend server=thecodegirl/frontend:${env.BUILD_ID}
                    kubectl set image deployment/loadgenerator frontend-check=thecodegirl/loadgenerator:${env.BUILD_ID}
                    kubectl set image deployment/paymentservice server=thecodegirl/paymentservice:${env.BUILD_ID}
                    kubectl set image deployment/productcatalogservice server=thecodegirl/productcatalogservice:${env.BUILD_ID}
                    kubectl set image deployment/recommendationservice server=thecodegirl/recommendationservice:${env.BUILD_ID}
                    kubectl set image deployment/shippingservice server=thecodegirl/shippingservice:${env.BUILD_ID}
                    """
                }
            }
        }
        stage('Restart Pods') {
            steps {
                script {
                    // Use kubectl to trigger a rolling restart of the deployment
                    sh """
                    kubectl rollout restart deployment.apps/adservice
                    kubectl rollout restart deployment.apps/cartservice
                    kubectl rollout restart deployment.apps/checkoutservice
                    kubectl rollout restart deployment.apps/currencyservice
                    kubectl rollout restart deployment.apps/emailservice
                    kubectl rollout restart deployment.apps/frontend
                    kubectl rollout restart deployment.apps/loadgenerator
                    kubectl rollout restart deployment.apps/paymentservice
                    kubectl rollout restart deployment.apps/productcatalogservice
                    kubectl rollout restart deployment.apps/recommendationservice
                    kubectl rollout restart deployment.apps/redis-cart
                    kubectl rollout restart deployment.apps/shippingservice
                    """
                }
            }
        }
    }
}

pipeline {

  agent any

  environment {
    DOCKER_HUB_CREDENTIALS = 'Supreme070:Badboy123'
    AWS_ACCESS_KEY_ID = 'AKIA5TCF5DW2CRGE5KPF'
    AWS_SECRET_ACCESS_KEY = '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'
  }

  stages {

    stage('Build Images') {

      steps {

        script {
      
        // Build and push adservice
        docker.build("thecodegirl/adservice:${env.BUILD_ID}", "-f ./microservices-demo/src/adservice/Dockerfile /var/lib/jenkins/adservice")
        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
          docker.image("thecodegirl/adservice:${env.BUILD_ID}").push()
          docker.image("thecodegirl/adservice:${env.BUILD_ID}").push('latest')  
        }
        
        // Build and push cartservice
        docker.build("thecodegirl/cartservice:${env.BUILD_ID}", "-f ./microservices-demo/src/cartservice/src/Dockerfile /var/lib/jenkins/cartservice/src")
        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
          docker.image("thecodegirl/cartservice:${env.BUILD_ID}").push()
          docker.image("thecodegirl/cartservice:${env.BUILD_ID}").push('latest')
        }
        
        // Build and push checkoutservice
        docker.build("thecodegirl/checkoutservice:${env.BUILD_ID}", "-f ./microservices-demo/src/checkoutservice/Dockerfile /var/lib/jenkins/checkoutservice")
        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
          docker.image("thecodegirl/checkoutservice:${env.BUILD_ID}").push() 
          docker.image("thecodegirl/checkoutservice:${env.BUILD_ID}").push('latest')
        }
        
        // Build and push currencyservice
        docker.build("thecodegirl/currencyservice:${env.BUILD_ID}", "-f ./microservices-demo/src/currencyservice/Dockerfile /var/lib/jenkins/currencyservice")
        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
          docker.image("thecodegirl/currencyservice:${env.BUILD_ID}").push()
          docker.image("thecodegirl/currencyservice:${env.BUILD_ID}").push('latest')
        }
        
        // Build and push emailservice
        docker.build("thecodegirl/emailservice:${env.BUILD_ID}", "-f ./microservices-demo/src/emailservice/Dockerfile /var/lib/jenkins/emailservice") 
        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
          docker.image("thecodegirl/emailservice:${env.BUILD_ID}").push()
          docker.image("thecodegirl/emailservice:${env.BUILD_ID}").push('latest') 
        }
        
        // Build and push frontend
        docker.build("thecodegirl/frontend:${env.BUILD_ID}", "-f ./microservices-demo/src/frontend/Dockerfile /var/lib/jenkins/frontend")
        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
          docker.image("thecodegirl/frontend:${env.BUILD_ID}").push()
          docker.image("thecodegirl/frontend:${env.BUILD_ID}").push('latest')  
        }
        
        // Build and push loadgenerator
        docker.build("thecodegirl/loadgenerator:${env.BUILD_ID}", "-f ./microservices-demo/src/loadgenerator/Dockerfile /var/lib/jenkins/loadgenerator")
        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
          docker.image("thecodegirl/loadgenerator:${env.BUILD_ID}").push()
          docker.image("thecodegirl/loadgenerator:${env.BUILD_ID}").push('latest')
        }
        
        // Build and push paymentservice 
        docker.build("thecodegirl/paymentservice:${env.BUILD_ID}", "-f ./microservices-demo/src/paymentservice/Dockerfile /var/lib/jenkins/paymentservice")
        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
          docker.image("thecodegirl/paymentservice:${env.BUILD_ID}").push() 
          docker.image("thecodegirl/paymentservice:${env.BUILD_ID}").push('latest')
        }
        
        // Build and push productcatalogservice
        docker.build("thecodegirl/productcatalogservice:${env.BUILD_ID}", "-f ./microservices-demo/src/productcatalogservice/Dockerfile /var/lib/jenkins/productcatalogservice")
        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
          docker.image("thecodegirl/productcatalogservice:${env.BUILD_ID}").push()
          docker.image("thecodegirl/productcatalogservice:${env.BUILD_ID}").push('latest')
        }
        
        // Build and push recommendationservice
        docker.build("thecodegirl/recommendationservice:${env.BUILD_ID}", "-f ./microservices-demo/src/recommendationservice/Dockerfile /var/lib/jenkins/recommendationservice")
        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
          docker.image("thecodegirl/recommendationservice:${env.BUILD_ID}").push()
          docker.image("thecodegirl/recommendationservice:${env.BUILD_ID}").push('latest')  
        }
        
        // Build and push shippingservice
        docker.build("thecodegirl/shippingservice:${env.BUILD_ID}", "-f ./microservices-demo/src/shippingservice/Dockerfile /var/lib/jenkins/shippingservice")
        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
          docker.image("thecodegirl/shippingservice:${env.BUILD_ID}").push()
          docker.image("thecodegirl/shippingservice:${env.BUILD_ID}").push('latest')
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

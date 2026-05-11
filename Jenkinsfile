pipeline {
    agent any

    environment {
  IMAGE = "devops-hub"
  TAG = "latest"

  DOCKER_CREDS = credentials('token')
    }


    stages {
        stage ('Checkout repo') {
            steps{
                echo 'repo cloned'
                git branch: 'main', url: 'https://github.com/aakash10chauhan/Devops-hub.git'
            }
            
        }

        stage ('build Image') {
            steps {
            echo 'building image'
            sh 'docker build -t ${IMAGE}:${TAG} .'
            }
        }

        stage ('login to docker') {
            steps{
            echo 'logging in to docker'
            sh 'echo \$DOCKER_CREDS_PSW | docker login -u \$DOCKER_CREDS_USR --password-stdin'
            }
        }

        stage ('Tag image') {
            steps{
            sh 'docker tag ${IMAGE}:${TAG} astro103/devops-hub:${TAG}'
            }
        }

        stage ('push to docker') {
            steps {
            echo 'Image push to docker hub'
            sh 'docker push astro103/devops-hub:${TAG}'
            }
        }
    }  
}
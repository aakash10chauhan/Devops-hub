pipeline {
    agent any

    environment {
  IMAGE = "devops-hub"
  TAG = "latest"

  DOCKER_CREDS = credentials('token')
    }


    stages {
        stage ('Checkout repo') {
            git branch: 'main', url: 'https://github.com/aakash10chauhan/Devops-hub.git'
        }

        stage ('build Image') {
            echo 'building image'
            sh 'docker build -t ${IMAGE}:${TAG} .'
        }

        stage ('login to docker') {
            echo 'logging in to docker'
            sh 'echo \$DOCKER_CREDS_PSW | docker login -u \$DOCKER_CREDS_USR --password-stdin'
        }

        stage ('push to docker') {
            echo 'Image push to docker hub'
            sh 'docker push '
        }
    }
    
}
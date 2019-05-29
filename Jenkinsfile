pipeline {
    agent any
    stages {
        stage('Build and Test Application') {
            steps {
                sh 'mvn clean verify'
            }
        }
        stage('Create Docker image') {
            steps {
                sh 'sudo docker build -t hello-jenkinspipelines + ":$BUILD_NUMBER" .'
            }
        }
        stage('Push Docker image to local registry') {
            steps {
                sh 'sudo docker tag hello-jenkinspipelines + ":$BUILD_NUMBER" localhost:5000/hello-jenkinspipelines + ":$BUILD_NUMBER"'
                sh 'sudo docker push localhost:5000/hello-jenkinspipelines + ":$BUILD_NUMBER"'
            }
        }
    }
}
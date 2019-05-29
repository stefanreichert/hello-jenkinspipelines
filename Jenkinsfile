pipeline {
    agent any
    environment {
        REGISTRY_HOST = 'localhost:5000'
    }
    stages {
        stage('build and test Application') {
            steps {
                sh 'mvn clean verify'
            }
        }
        stage('create Docker image') {
            steps {
                sh 'sudo docker build -t hello-jenkinspipelines:$BUILD_NUMBER .'
            }
        }
        stage('tag and push Docker image to local registry') {
            steps {
                sh 'sudo docker tag hello-jenkinspipelines:$BUILD_NUMBER $REGISTRY_HOST/hello-jenkinspipelines:$BUILD_NUMBER'
                sh 'sudo docker push $REGISTRY_HOST/hello-jenkinspipelines:$BUILD_NUMBER'
            }
        }
    }
}
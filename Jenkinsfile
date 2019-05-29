pipeline {
    agent any
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
                sh 'sudo docker tag hello-jenkinspipelines:$BUILD_NUMBER localhost:5000/hello-jenkinspipelines:$BUILD_NUMBER'
                sh 'sudo docker push localhost:5000/hello-jenkinspipelines + ":$BUILD_NUMBER"'
            }
        }
    }
}
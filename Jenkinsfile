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
                docker build -t hello-jenkinspipelines .
            }
        }
    }
}
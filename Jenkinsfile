pipeline {
    agent any
    environment {
        REGISTRY_HOST = 'localhost:5000'
        VERSION = buildVersionString()
    }
    stages {
        stage('build and test Application') {
            steps {
                sh 'mvn clean verify'
            }
        }
        stage('create Docker image') {
            steps {
                sh 'sudo docker build -t hello-jenkinspipelines:$VERSION .'
                sh 'sudo docker tag hello-jenkinspipelines:$VERSION hello-jenkinspipelines:latestBuild'
            }
        }
        stage('tag and push Docker image to local registry') {
            steps {
                sh 'sudo docker tag hello-jenkinspipelines:$VERSION $REGISTRY_HOST/hello-jenkinspipelines:$VERSION'
                sh 'sudo docker push $REGISTRY_HOST/hello-jenkinspipelines:$VERSION'
                sh 'sudo docker tag hello-jenkinspipelines:$VERSION $REGISTRY_HOST/hello-jenkinspipelines:latestBuild'
                sh 'sudo docker push $REGISTRY_HOST/hello-jenkinspipelines:latestBuild'
            }
        }
    }
}
def buildVersionString() {
    return '1.0.0_' + env.BUILD_NUMBER
}
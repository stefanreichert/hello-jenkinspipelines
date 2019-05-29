pipeline {
    agent any
    environment {
        REGISTRY_HOST = 'localhost:5000'
        VERSION = buildVersionString()
    }
    stages {
        stage('build and test Application') {
            steps {
                echo "building application version ${VERSION} ..."
                sh 'mvn clean verify'
            }
        }
        stage('create Docker image') {
            steps {
                echo "building docker image version ${VERSION} ..."
                sh 'sudo docker build -t hello-jenkinspipelines:$VERSION .'
                sh 'sudo docker tag hello-jenkinspipelines:$VERSION hello-jenkinspipelines:latestBuild'
            }
        }
        stage('tag and push Docker image to registry') {
            steps {
                echo "pushing version ${VERSION} to registry at ${REGISTRY_HOST} ..."
                sh 'sudo docker tag hello-jenkinspipelines:$VERSION $REGISTRY_HOST/hello-jenkinspipelines:$VERSION'
                sh 'sudo docker push $REGISTRY_HOST/hello-jenkinspipelines:$VERSION'
                sh 'sudo docker tag hello-jenkinspipelines:$VERSION $REGISTRY_HOST/hello-jenkinspipelines:latestBuild'
                sh 'sudo docker push $REGISTRY_HOST/hello-jenkinspipelines:latestBuild'
            }
        }
    }
}
def buildVersionString() {
    return '1.0_' + env.BUILD_NUMBER
}
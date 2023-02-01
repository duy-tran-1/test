pipeline {
    agent { label 'jenkinslaves' }
    stages {
        stage('Build docker image') {
            steps {
                sh 'sudo docker build -t demo-backend .'
            }
        }
        stage('Test image') {
            steps {
                sh 'echo "Tests successful"'
            }
        }
        stage('Push image to OCIR') {
            steps {
                sh "sudo docker login -u 'dttaunonprodoci/dutran@deloitte.com.au' -p 'g;_5WU)J16X-hq7PqS#C' ap-sydney-1.ocir.io"
                sh "sudo docker tag demo-backend ap-sydney-1.ocir.io/dttaunonprodoci/demo-backend:test1"
                sh "sudo docker push ap-sydney-1.ocir.io/dttaunonprodoci/demo-backend:test1"
            }
        }
    }
}
pipeline {
    agent any
    
    environment {
        registry = "aabdulsalams/sample-app"
        registryCredential = 'dockerHub'
        serverCredential = 'serverSSH'
        serverEndpoint = credentials('salamServer')
        dockerImage = ''
    }

    stages {
        stage('Getting repository') {
            steps {
                git 'https://github.com/aabdulsalams/sample-app.git'
            }
        }
        
        stage('Building Image') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }
        
        stage('Deploying to Dockerhub') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        
        stage('Deploying to production') {
            steps{
                sshagent(credentials: [serverCredential]) {
                    sh '''
                        ssh -o StrictHostKeyChecking=no root@${serverEndpoint} \
                        "docker pull ${registry} && \
                        docker container stop appnodejs || true && \
                        docker container rm appnodejs || true && \
                        docker run -d --name appnodejs -p 8889:3000 ${registry}"
                    
                    '''
                }
            }
        }
        
        stage('Cleaning Up') {
            steps{
              sh "docker rmi --force $registry"
            }
        }
    }
}

pipeline {
   agent any
   stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], 
                extensions: [], 
                userRemoteConfigs: [[credentialsId: 'e1ca9299-b62b-4289-a477-5c73c0bab0eb', 
                url: 'https://github.com/etech-project/jenkins.git']]])
            }
        }     
    }
}

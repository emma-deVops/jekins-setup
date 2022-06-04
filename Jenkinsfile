pipeline {
   agent any
   stages {
        stage('Checkout') {
            steps {
               checkout([$class: 'GitSCM', branches: [[name: '*/main']], 
               extensions: [], 
               userRemoteConfigs: [[credentialsId: 'efbdd6c7-9b42-475f-bbf7-ee614ef9f069', 
               url: 'https://github.com/emma-deVops/jekins-setup.git']]])
            }
        }     
    }
}

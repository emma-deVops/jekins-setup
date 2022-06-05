pipeline {
   agent any
   stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/dev']], 
                extensions: [], 
                userRemoteConfigs: [[credentialsId: '43ba96fd-80d1-420f-93fc-7f3e5154f064', 
                url: 'https://github.com/emma-deVops/jekins-setup.git']]])
            }
        } 
        stage ("terraform init") {
            steps {
                sh ('terraform init') 
            }
        }
        
        stage ("terraform Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
           }
        }
    }
}    
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
             checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'd03a7084-edd7-43c4-9555-33271cb03813', url: 'https://github.com/shekhar240723/terraform-gcp.git']])
            }

        }
        stage('Terraform init') {
          
            steps {

                sh 'terraform init'
              
            }
          
        }

         stage('Terraform plan') {

            steps {

                sh 'terraform plan'

            }
        }

        stage('Terraform apply') {

            steps {

                sh 'terraform apply --auto-approve'

            }

        }

    }
}

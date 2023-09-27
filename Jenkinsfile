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

        stage('Terraform destroy') {

            steps {

                sh 'terraform destroy --auto-approve'

            }

        }

stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool name: 'sonarqube', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                    def scanner = "${scannerHome}/bin/sonar-scanner"
                    def sonarCmd = "${scanner} -Dsonar.projectKey=shekhar2 -Dsonar.host.url=http://13.232.246.186:9000 -Dsonar.login=sqa_d65a97c09af2fec2a83e41b86de8070530ddd324"
                    sh sonarCmd
                }
            }
        }
    }
}

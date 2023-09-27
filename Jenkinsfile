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

stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool name: 'sonarqube', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                    def scanner = "${scannerHome}/bin/sonar-scanner"
                    def sonarCmd = "${scanner} -Dsonar.projectKey=shekhar -Dsonar.host.url=http://13.232.246.186:9000 -Dsonar.login=sqp_60233075743bb622b9eb12b21e12364b8874101a"
                    sh sonarCmd
                }
            }
        }
    }
}

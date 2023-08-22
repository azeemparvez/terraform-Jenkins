pipeline {
    agent any
    stages {
        stage(checkout) {
            steps{
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/azeemparvez/terraform-Jenkins.git'
            }
        }
        stage(initialise) {
            steps{
                sh "terraform init"
            }
        }
        stage(plan) {
            steps{
                sh "terraform plan"
            }
        }
        stage(apply) {
            steps{
                sh "terraform apply"
            }
        }
    }
}
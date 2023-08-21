pipeline {
    agent any
    stages {
        stage(checkout) {
            steps{
                git branch: 'dev', credentialsId: 'github', url: 'https://github.com/azeemparvez/terraform-Jenkins.git'
            }
        }
    }
}
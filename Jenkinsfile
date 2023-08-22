pipeline {
    agent any
    stages {
        stage(checkout) {
            steps{
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/azeemparvez/terraform-Jenkins.git'
            }
        }
    }
}

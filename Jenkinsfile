pipeline {
    agent any 
    stages {
        stage('Clean') { 
            steps {
               sh label: '', script: 'make clean'
            }
        }
        stage('Make') { 
            steps {
                sh label: '', script: 'make all'
            }
        }
    }
    post {
    always {
                chuckNorris()
        }
    }
}

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
                sh label: '', script: 'make bin'
            }
        }
        stage('Doc') { 
           steps {
                sh label: '', script: 'make doc'
            }
            post {success {
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'html', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
            }}
        }
        stage('Check') { 
           steps {
                sh label: '', script: 'make cppcheck-xml'
            }
            post { always {
                publishCppcheck pattern: 'cppcheck.xml'
            }}
        }
        stage('Tests') { 
           steps {
                sh label: '', script: 'make tests-xml'
            }
            post { always {
                junit 'reports/tests/*.xml'
            }}
        } 
    }
    post {
    always {
                chuckNorris()
        }
    }
}

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
        }
        stage('Check') { 
           steps {
                sh label: '', script: 'make cppcheck-xml'
            }
        }
        stage('Tests') { 
           steps {
                sh label: '', script: 'make tests-xml'
            }
        } 
    }
    post {
    always {
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'html', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
                publishCppcheck pattern: 'cppcheck.xml'
                junit 'reports/tests/is_armstrong_number_tests.xml'

                chuckNorris()
        }
    }
}

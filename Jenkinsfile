pipeline {
    agent any
     tools {
        maven 'local_maven'
     }
    stages {
        stage('build') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}

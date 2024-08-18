pipeline {
    agent any
     tools {
        maven 'local_maven'
     }

    stages {
        stage('Run Unit Tests'){
            steps{
                mvn 'mvn clean test'
            }
        }
        stage('Static Code Analysis') {
            steps  {

             withCredentials([string(credentialsId: 'sonartoken', variable: 'SONAR_TOKEN')]){
                 sh '''
                mvn clean verify sonar:sonar \
                      -Dsonar.projectKey=campaign-service \
                      -Dsonar.projectName='campaign-service' \
                      -Dsonar.host.url=http://localhost:9000 \
                      -Dsonar.token=$SONARQUBE_TOKEN
                      '''
                }
            }
        }

        stage('build') {
             steps {
                  sh 'mvn clean install'
                  }
        }
    }
}

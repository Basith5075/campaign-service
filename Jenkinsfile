pipeline {
    agent any
     tools {
        maven 'local_maven'
     }

     environment {
        SONARQUBE_TOKEN = credentials('sonartoken')
     }

    stages {
        stage('Run Unit Tests'){
            steps{
                mvn 'mvn clean test'
            }
        }
        stage('Static Code Analysis') {
            steps  {

                 sh "mvn clean verify sonar:sonar \
                      -Dsonar.projectKey=campaign-service \
                      -Dsonar.projectName='campaign-service' \
                      -Dsonar.host.url=http://localhost:9000 \
                      -Dsonar.token=$SONARQUBE_TOKEN"
            }
        }

        stage('build') {
             steps {
                  sh 'mvn clean install'
                  }
        }
    }
}

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
                sh 'mvn clean test'
            }
        }
        stage('Static Code Analysis') {
            steps  {

                 sh '''
                 mvn clean verify sonar:sonar \
                      -Dsonar.projectKey=campaign-service \
                      -Dsonar.projectName='campaign-service' \
                      -Dsonar.host.url=http://localhost:9000 \
                      -Dsonar.token=$SONARQUBE_TOKEN
                      '''
           }
        }

        stage('Build Java Project') {
             steps {
                  sh 'mvn clean install'
                  }
        }

       stage('Create Docker image') {
            steps {
                script {
                    sh 'docker build -t basith321/campaign-service:v0.1 .'
                }
            }
       }

       stage('Docker Hub: Image Push') {
                   steps {
                       script {
                           sh 'docker push basith321/campaign-service:v0.1'
                       }
                   }
        }

    }
}

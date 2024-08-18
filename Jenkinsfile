pipeline {
    agent any
     tools {
        maven 'local_maven'
     }

     environment {
        SONARQUBE_TOKEN = "sqp_69cb360dbf9e71bd6b65ee9ac841fb4bfa664b67"
     }

    stages {
        stage('Run Unit Tests'){
            steps{
                mvn 'mvn clean test'
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

        stage('build') {
             steps {
                  sh 'mvn clean install'
                  }
        }
    }
}

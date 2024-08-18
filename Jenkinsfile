pipeline {
    agent any
     tools {
        maven 'local_maven'
     }
    stages {
        stage('Static Code Analysis') {
            steps {
                 sh '''
                mvn clean verify sonar:sonar \
                      -Dsonar.projectKey=campaign-service \
                      -Dsonar.projectName='campaign-service' \
                      -Dsonar.host.url=http://localhost:9000 \
                      -Dsonar.token=sqp_69cb360dbf9e71bd6b65ee9ac841fb4bfa664b67
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

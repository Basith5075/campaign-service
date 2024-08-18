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


export MAVEN_HOME=/opt/homebrew/Cellar/maven/3.9.8/libexec
export PATH=$PATH:$MAVEN_HOME/bin
mvn --version
mvn clean package
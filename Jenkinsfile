pipeline {
agent any
      stages {
          stage('Build') {
              steps {
                  echo 'Planning..'
                  terraform plan
} }
          stage('Test') {
              steps {
                  echo 'Testing..'
              }
          }
          stage('Deploy') {
              steps {
                  echo 'Deploying....'
                  sh 'ls -lah'
} }
} }

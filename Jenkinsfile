pipeline {
  agent any
      stages {
          stage('Test') {
              steps {
                  echo 'Testing..'
                  sh '/usr/local/bin/terraform validate'
              }
          }
          stage('Build') {
              steps {
                  echo 'Planning..'
                  sh '/usr/local/bin/terraform init'
                  sh '/usr/local/bin/terraform plan'
              }
          }
          stage('Deploy') {
              steps {
                  echo 'Deploying....'
                  sh 'ls -lah'
              }
          }
      }
}

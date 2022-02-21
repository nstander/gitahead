pipeline {
  agent any
  stages {
    stage('Configure') {
      steps {
        sh '''echo $WORKSPACE
./config -fPIC'''
      }
    }

    stage('Build') {
      steps {
        sh 'make'
      }
    }

  }
}
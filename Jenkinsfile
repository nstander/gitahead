pipeline {
  agent any
  stages {
    stage('Configure') {
      steps {
        sh './config -fPIC'
      }
    }

    stage('Build') {
      steps {
        sh 'make'
      }
    }

  }
}
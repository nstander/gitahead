pipeline {
  agent any
  stages {
    stage('Submodules') {
      steps {
        sh '''git submodule init
git submodule update'''
      }
    }

    stage('OpenSSL') {
      steps {
        sh '''cd dep/openssl/openssl
./config -fPIC
make'''
      }
    }

  }
}
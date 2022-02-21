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
make
cd ../../..'''
      }
    }

    stage('Build') {
      steps {
        sh '''mkdir -p build/release
cd build/release
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ../..
ninja'''
      }
    }

  }
}
pipeline {
  agent any
  stages {
    stage('Submodules') {
      steps {
        sh '''git submodule init
git submodule update'''
      }
    }

    stage('Build') {
      steps {
        sh '''mkdir -p build/release
cd build/release
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/home/nstander/Qt/5.12.0/gcc_64/ ../..
ninja'''
      }
    }

  }
}
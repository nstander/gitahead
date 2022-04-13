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
        sh '''cd dep/openssl/openssl
./config -fPIC
make

cd ../../..
rm -rf build/release
mkdir -p build/release
cd build/release
cmake -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/var/lib/jenkins/workspace/Qt/5.12.0/gcc_64/ ../..
ninja'''
      }
    }

    stage('Statistics') {
      steps {
        sh '''pwd
ls
STIHOME=/var/lib/jenkins/workspace/scitools/bin/linux64
export LD_PRELOAD=/lib64/libfreetype.so.6
$STIHOME/und -setlicensecode ocyMEB5boh4nrnp2
$STIHOME/und help'''
        mineRepository()
        discoverGitReferenceBuild()
        recordIssues(tool: gcc())
      }
    }

  }
}
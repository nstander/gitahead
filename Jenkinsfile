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
        sh '''STIHOME=/var/lib/jenkins/workspace/scitools/bin/linux64
export LD_PRELOAD=/lib64/libfreetype.so.6
$STIHOME/und -setlicensecode ocyMEB5boh4nrnp2
mkdir ccout
$STIHOME/und analyze -errors -sarif und_analyze.sarif codecheck -sarif und_ccrecommended.sarif "SciTools\' Recommended Checks" ccout/ gitahead.und '''
        mineRepository()
        discoverGitReferenceBuild()
        recordIssues(tool: gcc())
      }
    }

  }
}
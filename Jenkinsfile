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
      environment {
        STIHOME = '/var/lib/jenkins/workspace/scitools/bin/linux64'
        LD_PRELOAD = '/lib64/libfreetype.so.6'
      }
      steps {
        sh './runund.sh'
        mineRepository()
        discoverGitReferenceBuild()
        recordIssues(tools: [gcc(), sarif(pattern: 'und_analyze.sarif', name: 'Understand Analysis', id: 'UndAnalysis'),sarif(pattern: 'und_ccrecommended.sarif', id:'UndCCRecommended', name: 'Understand Codecheck Recommended')])
      }
    }

  }
}
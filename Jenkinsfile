 pipeline {
    agent any

	 
	environment{
	// Define environment variables here
	GIT_REPO_URL = 'https://github.com/DevuniDivya/mindcircuit15d.git'
	GIT_BRANCH = 'main'
	TOMACT_URL = 'http://ec2-54-197-10-71.compute-1.amazonaws.com:8081/'
	CONTEXT_PATH = 'devops-app'
	WAR_FILE_PATH = '**/*.war'
	}

	stages {
	stage ('clean workspace'){
	steps {
	cleanWS()
	}
	}
        stage('CLONE GITHUB CODE') {
            steps {
                echo 'In this stage clone will be cloned'
				git branch: '${GIT_BRANCH}', url: '${GIT_REPO_URL}'
			
            }
        }
 		
           stage('BUILD THE CODE') {
            steps {
                echo 'In this stage code will be built and mvn artifact will be generated'
           sh 'mvn clean install'
			}
			
        }
   		
            stage('DEPLOY') {
            steps {
                echo 'In this stage .war artifact will bedeployed onto Tomcat'
				deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: '${TOMCAT_URL}')], contextPath: '${CONTEXT_PATH}', war: '${WAR_FILE_PATH}'
            }
        }
    }
 }

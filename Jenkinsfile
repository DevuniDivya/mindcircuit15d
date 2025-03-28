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
	
        stage('Clone git Repo') {
            steps {
                echo 'Cloning code from Github Repo'
				git branch: '${GIT_BRANCH}', url: '${GIT_REPO_URL}'
			
            }
        }
 		
           stage('Build Artifact') {
            steps {
                echo 'Building Artifact using maven build tool'
           sh 'mvn clean install'
			}
			
        }
   		
            stage('Deploy to Tomcat') {
            steps {
                echo 'Deploying Artifact on to Tomcat'
				deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: '${TOMCAT_URL}')], contextPath: '${CONTEXT_PATH}', war: '${WAR_FILE_PATH}'
            }
        }
    }
	

pipeline {
    agent any
	
 triggers {
 githubPush()
 }
 
    stages { 
	stage ('clean workspace'){
	steps {
	cleanWS()
	}
	}
	
        stage('Clone git Repo') {
            steps {
                echo 'Cloning code from Github Repo'
				git branch: 'main', url: 'https://github.com/DevuniDivya/mindcircuit15d.git'
			
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
				deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://ec2-54-197-10-71.compute-1.amazonaws.com:8081/')], contextPath: 'devops-app', war: '**/*.war'
            }
        }
    }
}

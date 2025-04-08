 
 pipeline {
    agent any

    stages { 
	
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
				deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://54.227.0.85:8082/')], contextPath: 'divyaapp', war: '**/*.war'
            }
        }
    }
}


pipeline {
    agent any

    stages { 
	
	  stage('Clean Workspace'){
	      steps {
	        cleanWS()
	        }
	         }
	
        
        stage('Clone git Repo') {
		
            steps {
			
			script{
			
			try {
                echo 'Cloning code from Github Repo'
				git branch: 'main', url: 'https://github.com/DevuniDivya/mindcircuit15d.git'
			}
			catch (Exception e){
			echo "stage 1 failed: ${e.message}"
			}
            }
        }
        } 
   		
            stage('Deploy to multiple environments') {
			parallel {
			    stage('Lab'){
                steps {
                echo 'Deploying on lab...'
				}
				}
			stage('Sbox'){
            steps {
                echo 'Running Maven package...'
				}
				}
				stage('UAT'){
            steps {
                echo 'Running Maven install...'
				}
				}
				stage('PROD'){
            steps {
                echo 'Running Maven install...'
				}
				}
            }
        }
    }
 }

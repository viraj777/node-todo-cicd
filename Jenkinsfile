def agents  = ['agent-1','agent-2']
 
def generateStage(nodeLabel) {
    return {
        stage("Runs on ${nodeLabel}") {
            node(nodeLabel) {
               script {
                    echo "disabling TLS certificate checking against repo."
                    git([url: 'https://github.com/viraj777/node-todo-cicd.git', branch: 'master', disableCertificateValidation: true])

		    echo "Stage 1: Cloning repo"
                    git branch: 'master', url: 'https://github.com/viraj777/node-todo-cicd.git'

		    echo "Stage 2: Building docker image"
		    sh "docker build . -t virajthorat776/node-todo-app"

		    echo "Stage 3: pushing image to dockerhub"
		    withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                    sh "docker login -u ${env.USERNAME} -p ${env.PASSWORD}"
                    sh "docker push virajthorat776/node-todo-app"

		    echo "Stage 4: Deploying docker image as container"
		    sh "docker-compose down --remove-orphans && docker-compose up -d"
		    
                }
            }
        }
    }
  }
}
def parallelStagesMap = agents.collectEntries {
    ["${it}" : generateStage(it)]
}
pipeline {
    agent none
    stages {
        stage('non-parallel stage') {
            steps {
                echo 'this stage will be executed first.'
            }
        }
        stage('parallel stage') {
            steps {
                script {
                    parallel parallelStagesMap
                }
            }
        }       
    }
}

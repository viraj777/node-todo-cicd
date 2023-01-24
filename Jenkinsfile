pipeline{

      agent none

    stages {

	stage("clone_repo") {
		
		agent { label 'agent2' }
		
	steps {

	git branch: 'master', url: 'https://github.com/viraj777/node-todo-cicd.git'

        }

      }

        stage("build_image") {

		agent { label 'agent2' }
		
	steps {

	sh "docker build . -t virajthorat776/node-todo-app"

	}

      }

	stage("push_image") {

		agent { label 'agent2' }
		
	steps {

          withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){

          sh "docker login -u ${env.USERNAME} -p ${env.PASSWORD}"

          sh "docker push virajthorat776/node-todo-app"

          }
         }
       }

        stage("build") {

		agent { label 'agent2' }
		
        steps {
         sh "docker stack deploy -c docker-compose.yaml final_stack"
         
         }
        }
      }

    }

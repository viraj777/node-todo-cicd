pipeline{

	agent {
		
		label ('agent1 && agent2')
		
	}

    stages {

	stage("clone_repo") {

	steps {

	git branch: 'master', url: 'https://github.com/viraj777/node-todo-cicd.git'

        }

      }

        stage("build_image") {

	steps {

	sh "docker build . -t virajthorat776/node-todo-app"

	}

      }

	stage("push_image") {

	steps {

          withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){

          sh "docker login -u ${env.USERNAME} -p ${env.PASSWORD}"

          sh "docker push virajthorat776/node-todo-app"

          }
         }
       }

        stage("build") {

        steps {
         sh "docker-compose down --remove-orphans && docker-compose up -d"
         
         }
        }
      }

    }

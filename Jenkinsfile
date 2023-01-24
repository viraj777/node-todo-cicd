pipeline{

    agents any

    stages {

	stage("clone_repo") {

	step {

	git branch: 'master', url: 'https://github.com/viraj777/node-todo-cicd.git'

        }

      }

        stage("build_image") {

	step {

	sh "docker build . -t virajthorat776/node-todo-app"

	}

      }

	stage("push_image") {

	step {

          withCredentials([usernamePassword(credentialsId: 'Dockerhub_login', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){

          sh "docker login -u ${env.USERNAME} -p ${env.PASSWORD}"

          sh "docker push virajthorat776/node-todo-app"

          }
         }
       }

        stage("build") {

         sh "docker-compose down --remove-orphans && docker-compose up -d"

         }
       }

     }

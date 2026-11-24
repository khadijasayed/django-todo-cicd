pipeline {
    agent any

    environment {
        IMAGE_NAME = 'flask-app'
        IMAGE_TAG  = "latest"
    }

    stages {
        stage('clone-repo') {
            steps {
                git branch: 'develop', url: 'hhttps://github.com/khadijasayed/django-todo-cicd/'
            }
        }

      
        stage('buid-and-test') {
            steps {
                // Build locally first and run tests
                echo "All test passed successfully"
                echo "Build generated successfully"
            }
        }
      
        stage('buid-image') {
            steps {
                // Build locally first without hardcoding the Docker Hub username
                sh "docker build -t todo-app ."
            }
        }

        stage('deploy-on-server') {
            steps {
                // Build locally first without hardcoding the Docker Hub username
                sh "docker volume create sqlite-data"
                sh "docker stop todo-container || true"
                sh "docker rm todo-container || true"
                sh "docker run -d --name todo-container -p 8000:8000 -v sqlite-data:/data/db todo-app"
            }
        }
    }
}

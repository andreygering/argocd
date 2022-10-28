pipeline {
    agent any
    
    
        stage('GET SCM') {
            steps {
               git branch: 'main', url: 'https://github.com/andreygering/argocd'
            }
        }

        stage('Build and Test') {
            steps {
                sh 'docker build -t maven_app:v-0.1.0.${BUILD_NUMBER} .'
            }
        }

        stage('Tag Image') {
            steps {
                sh 'docker tag maven_app:v-0.1.0.${BUILD_NUMBER} andreygering/maven_app:v-0.1.0.${BUILD_NUMBER}'
            }
        }

        stage('Docker Login') {
            steps {
                sh 'docker login -u ${USERNAME} -p ${PASSWORD} '
            }
        }
        
        
        stage('Push Image') {
            steps {
                sh 'docker push andreygering/maven_app:v-0.1.0.${BUILD_NUMBER}'
            }
        }
     }
}

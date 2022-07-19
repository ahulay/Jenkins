pipeline { 
    agent any 

    environment {
        WEB_URL = "http://ya.ru"
        WEB_STATUS = ""
    }

    stages {
        stage('Git clone') { 
            steps { 
                // Get some code from a GitHub repository
                git url: 'git@github.com:ahulay/Jenkins.git', branch: 'main'
            }
        }
        stage('Run'){
            steps {
                // Change file permisson
                sh "chmod +x ./test_url.sh"
                // Run shell script
                script{
                    WEB_STATUS = sh(returnStdout: true, script: './test_url.sh ${WEB_URL}').trim()
                }
            }
        }
        stage('Notify') {
            steps {
                emailext (
                    body: "${WEB_STATUS}", 
                    from: 'aups4@yandex.ru',
                    to: '4aups1@gmail.com',
                    subject: 'web status'
                )
            }
        }
    }
}

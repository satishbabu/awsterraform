pipeline {
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    agent any
    stages {
        stage("plan") {
            steps {
                echo 'In Plan...'
                sh 'pwd;cd ec2/ ; terraform init'
                sh 'pwd;cd ec2/ ; terraform plan -out tfplan'
                sh 'pwd;cd ec2/ ; terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage("test") {
            steps {
                echo 'testing the application....'
            }
        }

        stage("deploy") {
            steps {
                echo 'deploying the application....'
            }
        }
    }
}

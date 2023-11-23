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
                sh 'pwd;cd web-app-server/ ; terraform init'
                sh 'pwd;cd web-app-server/ ; terraform plan -out tfplan'
                sh 'pwd;cd web-app-server/ ; terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage("Approval") {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }
            
            steps {
                script {
                    echo 'Approval....'
                    def plan = readFile 'web-app-server/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }

        stage("Apply") {
            steps {
                echo 'Apply...'
                sh "pwd; cd web-app-server/; terraform apply -input=false tfplan"
            }
        }
    }
}

pipeline {
  agent any

  environment {
    AWS_REGION = 'ap-south-1'
  }

  stages {
    stage('Clone Repo') {
      steps {
        git branch: 'main', url: 'https://github.com/abykpaul/Terraform-Aws-Jenkins-Mig.git'
      }
    }

    stage('Terraform Init') {
      steps {
        withAWS(credentials: 'aws-creds', region: 'ap-south-1') {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        withAWS(credentials: 'aws-creds', region: 'ap-south-1') {
          sh 'terraform plan'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        input "Proceed?"
        withAWS(credentials: 'aws-creds', region: 'ap-south-1') {
          sh 'terraform apply -auto-approve'
        }
      }
    }
  }
}

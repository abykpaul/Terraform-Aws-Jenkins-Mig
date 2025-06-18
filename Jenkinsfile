pipeline {
  agent any

  environment {
    AWS_REGION = 'ap-south-1'
    AWS_DEFAULT_REGION = 'ap-south-1'
  }

  stages {
    stage('Clone Repo') {
      steps {
        git 'https://github.com/your-username/your-repo.git'
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
        input "Proceed with Terraform Apply?"
        withAWS(credentials: 'aws-creds', region: 'ap-south-1') {
          sh 'terraform apply -auto-approve'
        }
      }
    }
  }
}

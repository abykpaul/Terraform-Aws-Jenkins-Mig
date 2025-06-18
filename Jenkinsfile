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
        withAWS(credentials: 'aws-creds', region: "${AWS_REGION}") {
          bat 'terraform init -input=false'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        withAWS(credentials: 'aws-creds', region: "${AWS_REGION}") {
          bat 'terraform plan -out=tfplan.out'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        input "Proceed to apply infrastructure?"
        withAWS(credentials: 'aws-creds', region: "${AWS_REGION}") {
          bat 'terraform apply -auto-approve tfplan.out'
        }
      }
    }

    stage('Terraform Destroy') {
      steps {
        input "Do you want to destroy the infrastructure?"
        withAWS(credentials: 'aws-creds', region: "${AWS_REGION}") {
          bat 'terraform destroy -auto-approve'
        }
      }
    }
  }
}

pipeline {
  agent any

  environment {
    TF_VAR_region = 'ap-south-1'
  }

  stages {
    stage('Clone Repo') {
      steps {
        git 'https://github.com/abykpaul/Terraform-Aws-Jenkins-Mig.git'
      }
    }

    stage('Terraform Init') {
      steps {
        dir('terraform'){
        sh 'terraform init'
      }
    }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan'
      }
    }

    stage('Terraform Apply') {
      steps {
        input "Proceed to apply?"  // Manual confirmation
        sh 'terraform apply -auto-approve'
      }
    }
  }
}

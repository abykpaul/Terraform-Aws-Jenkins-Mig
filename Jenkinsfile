pipeline {
  agent any

  
  parameters {
    choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'prod'], description: 'Select the environment')
    choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Terraform Action')
    string(name: 'TF_VAR_FILE', defaultValue: 'dev.tfvars', description: 'Name of the .tfvars file')
  }

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
        withAWS(credentials: 'aws-creds', region: "${env.AWS_REGION}") {
          bat 'terraform init'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        withAWS(credentials: 'aws-creds', region: "${env.AWS_REGION}") {
          bat "terraform plan -var-file=${params.TF_VAR_FILE}"
        }
      }
    }

    stage('Terraform Action') {
      steps {
        input message: "Proceed with Terraform ${params.ACTION}?"
        withAWS(credentials: 'aws-creds', region: "${env.AWS_REGION}") {
          script {
            if (params.ACTION == 'apply') {
              bat "terraform apply -auto-approve -var-file=${params.TF_VAR_FILE}"
            } else if (params.ACTION == 'destroy') {
              bat "terraform destroy -auto-approve -var-file=${params.TF_VAR_FILE}"
            }
          }
        }
      }
    }
  }
}

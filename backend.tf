terraform {
  backend "s3" {
    bucket         = "my-terraform-jenkins-bucket"   # 🔁 Change this to your bucket name
    key            = "jenkins/terraform.tfstate"
    region         = "ap-south-1"
  }
}

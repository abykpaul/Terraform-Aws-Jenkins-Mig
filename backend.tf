terraform {
  backend "s3" {
    bucket         = "my-terraform-jenkins-bucket-aby01"   # 🔁 Change this to your bucket name
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}

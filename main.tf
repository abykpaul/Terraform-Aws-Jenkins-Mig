resource "aws_instance" "Jenkins_terra" {
  ami = "ami-0f535a71b34f2d44a"
  instance_type = "t2.micro"
}

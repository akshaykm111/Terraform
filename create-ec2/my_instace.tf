provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "crispy" {
  ami                    = "ami-0aff18ec83b712f05"
  instance_type          = "t2.micro"
  availability_zone      = "us-west-2a"
  key_name               = "crispy-key"
  vpc_security_group_ids = ["sg-063ea78c79c5ba038"]
  tags = {
    Name    = "Crispy-Chicken"
    Project = "Food-Order"
  }
}
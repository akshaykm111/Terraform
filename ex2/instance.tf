resource "aws_instance" "Crispy" {
    ami                    = var.AMIS[var.REGION]
    instance_type          = var.INSTANCE_TYPE
    availability_zone      = var.ZONE1
    key_name               = "crispy-key"
    vpc_security_group_ids = ["sg-063ea78c79c5ba038"]
    tags = {
      Name    = "Crispy-Chicken"
      Project = "Food-Order"
    }
  }
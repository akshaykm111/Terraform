# first generate public-key & private-key by using command (ssh-keygen -f ./samplekey -N "")

resource "aws_key_pair" "sample-key" {
    key_name   = "crispykey"
    public_key = file("samplekey.pub")
  }
  
  resource "aws_instance" "sample-inst" {
    ami                    = var.AMIS[var.REGION]
    instance_type          = var.INSTANCE_TYPE
    availability_zone      = var.ZONE1
    key_name               = aws_key_pair.sample-key.key_name
    vpc_security_group_ids = ["sg-063ea78c79c5ba038"]
    tags = {
      Name    = "Sample-Instance"
      Project = "Sample"
    }
  
    provisioner "file" {
      source      = "web.sh"
      destination = "/tmp/web.sh"
    }
  
    provisioner "remote-exec" {
      inline = [
        "chmod u+x /tmp/web.sh",
        "sudo /tmp/web.sh"
      ]
    }
  
    connection {
      user        = var.USER
      private_key = file("samplekey")
      host        = self.public_ip
    }
  }
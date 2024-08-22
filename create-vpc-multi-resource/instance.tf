resource "aws_key_pair" "sample-key" {
    key_name   = "crispykey"
    public_key = file("samplekey.pub")
  }
  
  resource "aws_instance" "my-private-inst" {
    ami                    = var.AMIS[var.REGION]
    instance_type          = var.INSTANCE_TYPE
    availability_zone      = var.ZONE1
    subnet_id              = aws_subnet.main1.id
    key_name               = aws_key_pair.sample-key.key_name
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = {
      Name    = "my-private-instance"
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
  
  output "Instance_Public_IP" {
    value = aws_instance.my-private-inst.public_ip
  }
  
  output "Instance_Private_IP" {
    value = aws_instance.my-private-inst.private_ip
  }
  
  resource "aws_ebs_volume" "my-storage" {
    availability_zone = var.ZONE1
    size              = 3
    tags = {
      Name = "my-private-instance"
    }
  }
  
  resource "aws_volume_attachment" "ebs_att" {
    device_name = "/dev/xvdh"
    volume_id   = aws_ebs_volume.my-storage.id
    instance_id = aws_instance.my-private-inst.id
  }
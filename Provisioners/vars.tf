variable "REGION" {
    default = "us-west-2"
  }
  
  variable "ZONE1" {
    default = "us-west-2a"
  }
  
  variable "INSTANCE_TYPE" {
    default = "t2.micro"
  }
  
  variable "AMIS" {
    type = map(any)
    default = {
      us-west-2 = "ami-094cc0ced7b91fcf0"  # CentOS-Stream-ec2-9, us-west-2
      us-east-2 = "ami-0862be96e41dcbf74"
    }
  }
  
  variable "USER" {
    default = "ec2-user"
  }
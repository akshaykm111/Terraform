variable "REGION" {
    default = "us-west-2"
  }
  
  variable "ZONE1" {
    default = "us-west-2a"
  }
  
  variable "ZONE2" {
    default = "us-west-2b"
  }
  
  variable "ZONE3" {
    default = "us-west-2c"
  }
  
  variable "ZONE4" {
    default = "us-west-2d"
  }
  
  variable "INSTANCE_TYPE" {
    default = "t2.micro"
  }
  
  variable "AMIS" {
    type = map(any)
    default = {
      us-west-2 = "ami-094cc0ced7b91fcf0"
      us-east-2 = "ami-0862be96e41dcbf74"
    }
  }
  
  variable "USER" {
    default = "ec2-user"
  }
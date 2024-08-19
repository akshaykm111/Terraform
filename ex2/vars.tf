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
      us-west-2 = "ami-0aff18ec83b712f05"
      us-east-2 = "ami-0862be96e41dcbf74"
    }
  }
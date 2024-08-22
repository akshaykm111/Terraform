terraform {
    backend "s3" {
      bucket = "terraform-akshay-state"
      key    = "terraform/backend_vpc"
      region = "us-west-2"
    }
  }
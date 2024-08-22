terraform {
    backend "s3" {
      bucket = "terraform-akshay-state"
      key    = "terraform/backend"
      region = "us-west-2"
    }
}
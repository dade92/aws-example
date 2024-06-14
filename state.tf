terraform {
  backend "s3" {
    bucket = "terraform-state-davide"
    key    = "terraform-state"
    region = "eu-central-1"
  }
}
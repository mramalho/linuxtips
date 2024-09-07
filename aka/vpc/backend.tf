terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "br.dev.ramalho-linuxtips"
    key    = "aka/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}
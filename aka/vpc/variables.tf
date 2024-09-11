variable "project_name" {
  type    = string
  default = "aka"
}

variable "default_tags" {
  type = map(string)
  default = {
    "Owner"       = "Marcos Ramalho (marcos@ramalho.dev.br)"
    "Environment" = "Developement"
    "Project"     = "Linuxtips AKA - Arquitetura de Containers na AWS - 2024"
    "ManagedBy"   = "Terraform"
  }
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "public_subnets_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}


variable "private_subnets_cidr" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "database_subnets_cidr" {
  type    = list(string)
  default = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
}
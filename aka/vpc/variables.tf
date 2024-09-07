variable "project_name" {
  type    = string
  default = "aka-linuxtips"
}

variable "default_tags" {
  type = map(string)
  default = {
    "Owner"       = "Marcos Ramalho (marcos@ramalho.dev.br)"
    "Environment" = "Developement"
    "Project"     = "AKA - Arquitetura de Containers na AWS - 2024"
    "ManagedBy"   = "Terraform"
  }
}

variable "cidr_block" {
  type    = string
  default = "172.16.0.0/16"
}

variable "availability_zone" {
  type    = list(string)
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

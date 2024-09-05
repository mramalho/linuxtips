variable "default_tags" {
  type = map(string)
  default = {
    "Owner"       = "Marcos Ramalho ( marcos@ramalho.dev.br )"
    "Environment" = "Developement"
    "Project"     = "AKA - Arquitetura de Containers na AWS"
    "ManagedBy"   = "Terraform"
  }
}
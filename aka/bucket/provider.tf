provider "aws" {
    region = "us-east-2"
    default_tags {
        tags = {
            Owner = "Marcos Ramalho"
            Environment = "dev"
            Project = "AKA - Arquitetura de Containers na AWS"
            ManagedBy = "Terraform"
        }
    }
}
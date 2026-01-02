terraform {
  backend "s3" {
    bucket         = "alomundo-terraform-state-unique-id" # O nome que você criou acima
    key            = "dev/alo-mundo/terraform.tfstate" # Caminho do arquivo dentro do bucket
    region         = "us-east-1"
    
    dynamodb_table = "alomundo-terraform-locks"
    encrypt        = true # Garante que o estado seja criptografado em repouso
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

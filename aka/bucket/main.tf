resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "br.dev.ramalho-linuxtips"  # Substitua pelo nome desejado para o bucket
  acl    = "private"

  versioning {
    enabled = true  # Habilita versionamento para preservar versões antigas do tfstate
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"  # Criptografia no lado do servidor
      }
    }
  }

  tags = {
    Name        = "terraform-state-bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

# resource "aws_dynamodb_table" "tf_lock_table" {
#   name         = "terraform-state-lock"
#   billing_mode = "PAY_PER_REQUEST"

#   hash_key = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   tags = {
#     Name        = "terraform-state-lock"
#     Environment = "dev"
#   }
# }

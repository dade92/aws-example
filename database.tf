resource "aws_dynamodb_table" "customer_table" {
  name         = "Customer"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ID"

  attribute {
    name = "ID"
    type = "S"
  }

  attribute {
    name = "username"
    type = "S"
  }

  global_secondary_index {
    name            = "UsernameIndex"
    hash_key        = "username"
    projection_type = "ALL"
  }

  tags = {
    Name        = "Customer"
    Environment = "dev"
  }
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.customer_table.name
}
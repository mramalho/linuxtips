resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = merge(
    var.default_tags,
    {
      "Name" = "example-instance"
    }
  )
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

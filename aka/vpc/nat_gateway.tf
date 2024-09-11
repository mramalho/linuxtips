resource "aws_eip" "nat-eip" {
  associate_with_private_ip = false

  tags = merge(
    var.default_tags,
    {
      "Name" = "${var.project_name}-nat-gateway"
    }
  )
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.public-subnets["us-east-2a"].id

  tags = merge(
    var.default_tags,
    {
      "Name" = "${var.project_name}-nat-gateway"
    }
  )
}

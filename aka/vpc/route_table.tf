# resource "aws_route" "public_internet-access" {
#   route_table_id         = aws_route_table.public-internet-access.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.igw.id
# }

resource "aws_route_table" "public-internet-access" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    var.default_tags,
    {
      "Name" = "${var.project_name}-public-route-table"
    }
  )
}

resource "aws_route_table_association" "public-subnet-access" {
  for_each       = { for az in var.availability_zones : az => az }
  subnet_id      = aws_subnet.public-subnets[each.key].id
  route_table_id = aws_route_table.public-internet-access.id
}

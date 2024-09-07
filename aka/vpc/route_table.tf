# # Atualizar as rotas privadas para usarem o único NAT Gateway
# resource "aws_route_table" "private_route_table" {
#   vpc_id = aws_vpc.my_vpc.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gateway.id
#   }

#   tags = merge(
#     var.default_tags,
#     {
#       "Name" = "${var.project_name}-prinvate-route-table"
#     }
#   )
# }

# # resource "aws_route_table" "public_route_table" {
# #   vpc_id = aws_vpc.my_vpc.id

# #   route {
# #     cidr_block = "0.0.0.0/0"
# #     gateway_id = aws_internet_gateway.igw.id
# #   }

# #   tags = merge(
# #     var.default_tags,
# #     {
# #       "Name" = "${var.project_name}-public-route-table"
# #     }
# #   )
# # }

# # Associar todas as subnets privadas à mesma tabela de rotas
# resource "aws_route_table_association" "private_subnet_association_a" {
#   subnet_id      = aws_subnet.private_subnet_a.id
#   route_table_id = aws_route_table.private_route_table.id
# }

# resource "aws_route_table_association" "private_subnet_association_b" {
#   subnet_id      = aws_subnet.private_subnet_b.id
#   route_table_id = aws_route_table.private_route_table.id
# }

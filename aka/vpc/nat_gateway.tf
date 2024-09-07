# # Criar um único NAT Gateway
# resource "aws_eip" "nat_eip" {
#   associate_with_private_ip = false
# }

# resource "aws_nat_gateway" "nat_gateway" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = aws_subnet.public_subnet_a.id # Usar a primeira subnet pública

#   tags = merge(
#     var.default_tags,
#     {
#       "Name" = "${var.project_name}-nat-gateway"
#     }
#   )
# }

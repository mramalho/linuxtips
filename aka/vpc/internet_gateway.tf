# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.my_vpc.id

#   tags = merge(
#     var.default_tags,
#     {
#       "Name" = "${var.project_name}-igw"
#     }
#   )
# }

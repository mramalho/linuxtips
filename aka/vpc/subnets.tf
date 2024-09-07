
resource "aws_subnet" "public-subnets" {
  for_each          = { for az in var.availability_zone : az => az }
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "${join(".", slice(split(".", var.cidr_block), 0, length(split(".", var.cidr_block)) - 2))}.${index(var.availability_zone, each.key) + 1}.0/24"
  availability_zone = each.value

  tags = merge(
    var.default_tags,
    {
      "Name" = "${var.project_name}-public-subnet-${var.availability_zone[index(var.availability_zone, each.key)]}"
    }
  )
}


resource "aws_subnet" "private-subnets" {
  for_each          = { for az in var.availability_zone : az => az }
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "${join(".", slice(split(".", var.cidr_block), 0, length(split(".", var.cidr_block)) - 2))}.${index(var.availability_zone, each.key) + 1}.0/24"
  availability_zone = each.value

  tags = merge(
    var.default_tags,
    {
      "Name" = "${var.project_name}-public-subnet-${var.availability_zone[index(var.availability_zone, each.key)]}"
    }
  )
}
# # Public Subnets
# resource "aws_subnet" "public_subnet_a" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "${join(".", slice(split(".", var.cidr_block), 0, length(split(".", var.cidr_block)) - 2))}.1.0/24"
#   availability_zone = "us-east-2a"

#   tags = merge(
#     var.default_tags,
#     {
#       "Name" = "${var.project_name}-public-subnet-a"
#     }
#   )

# }

# resource "aws_subnet" "public_subnet_b" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "${join(".", slice(split(".", var.cidr_block), 0, length(split(".", var.cidr_block)) - 2))}.2.0/24"
#   availability_zone = "us-east-2b"

#   tags = merge(
#     var.default_tags,
#     {
#       "Name" = "${var.project_name}-public-subnet-b"
#     }
#   )
# }

# # Private Subnets
# resource "aws_subnet" "private_subnet_a" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "${join(".", slice(split(".", var.cidr_block), 0, length(split(".", var.cidr_block)) - 2))}.3.0/24"
#   availability_zone = "us-east-2a"

#   tags = merge(
#     var.default_tags,
#     {
#       "Name" = "${var.project_name}-private-subnet-a"
#     }
#   )
# }

# resource "aws_subnet" "private_subnet_b" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "${join(".", slice(split(".", var.cidr_block), 0, length(split(".", var.cidr_block)) - 2))}.4.0/24"
#   availability_zone = "us-east-2b"

#   tags = merge(
#     var.default_tags,
#     {
#       "Name" = "${var.project_name}-private-subnet-b"
#     }
#   )
# }


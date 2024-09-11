resource "aws_subnet" "public-subnets" {
  for_each          = { for az in var.availability_zones : az => az }
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnets_cidr[index(var.availability_zones, each.key)]
  availability_zone = each.value

  tags = merge(
    var.default_tags,
    {
      "Name" = "${var.project_name}-public-subnet-${each.key}"
    }
  )
}

resource "aws_subnet" "private-subnets" {
  for_each          = { for az in var.availability_zones : az => az }
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnets_cidr[index(var.availability_zones, each.key)]
  availability_zone = each.value

  tags = merge(
    var.default_tags,
    {
      "Name" = "${var.project_name}-private-subnets-${each.key}"
    }
  )
}

resource "aws_subnet" "public-databases" {
  for_each          = { for az in var.availability_zones : az => az }
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.database_subnets_cidr[index(var.availability_zones, each.key)]
  availability_zone = each.value

  tags = merge(
    var.default_tags,
    {
      "Name" = "${var.project_name}-public-databases-${each.key}"
    }
  )
}

# https://www.site24x7.com/tools/ipv4-subnetcalculator.html

resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block

  tags = merge(
    var.default_tags,
    {
      "Name" = "${var.project_name}-vpc"
    }
  )
}
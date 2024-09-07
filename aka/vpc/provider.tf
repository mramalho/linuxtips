provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = merge(
      var.default_tags,
      {
        "Name" = "${var.project_name}"
      }
    )
  }
}
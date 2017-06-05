provider "aws" {
  region = "${var.env["region"]}"
}

resource "aws_vpc" "int_vpc" {
  cidr_block           = "${var.env["vpc_cidr"]}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Environment = "${var.env["environment"]}"
    Name        = "int_vpc"
    Project     = "${var.env["project_name"]}"
  }
}

resource "aws_internet_gateway" "int_igw" {
  vpc_id = "${aws_vpc.int_vpc.id}"

  tags {
    Environment = "${var.env["environment"]}"
    Name       = "int_igw"
    Project    = "${var.env["project_name"]}"
  }
}

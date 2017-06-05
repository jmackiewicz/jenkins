resource "aws_subnet" "int_public_subnet" {
  vpc_id                  = "${aws_vpc.int_vpc.id}"
  cidr_block              = "${var.env["int_public_cidr"]}"
  map_public_ip_on_launch = true
  depends_on              = ["aws_route_table.int_public_rt"]
  availability_zone       = "${var.env["availability_zone"]}"

  tags {
    Environment = "${var.env["environment"]}"
    Name       = "int_public_subnet"
    Project    = "${var.env["project_name"]}"
  }
}

resource "aws_subnet" "int_private_subnet1" {
  vpc_id                  = "${aws_vpc.int_vpc.id}"
  cidr_block              = "${var.env["int_private_cidr1"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${var.env["availability_zone"]}"

  tags {
    Environment = "${var.env["environment"]}"
    Name       = "int_private_subnet1"
    Project    = "${var.env["project_name"]}"
  }
}

resource "aws_subnet" "int_private_subnet2" {
  vpc_id                  = "${aws_vpc.int_vpc.id}"
  cidr_block              = "${var.env["int_private_cidr2"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${var.env["availability_zone"]}"

  tags {
    Environment = "${var.env["environment"]}"
    Name       = "int_private_subnet2"
    Project    = "${var.env["project_name"]}"
  }
}

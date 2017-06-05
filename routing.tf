resource "aws_route_table" "int_public_rt" {
  vpc_id = "${aws_vpc.int_vpc.id}"
}

resource "aws_route_table_association" "int_public_association" {
  subnet_id      = "${aws_subnet.int_public_subnet.id}"
  route_table_id = "${aws_route_table.int_public_rt.id}"
}

resource "aws_route_table" "int_private_rt" {
  vpc_id = "${aws_vpc.int_vpc.id}"
}

resource "aws_route_table_association" "int_private_association_1" {
  subnet_id      = "${aws_subnet.int_private_subnet1.id}"
  route_table_id = "${aws_route_table.int_private_rt.id}"
}

resource "aws_route_table_association" "int_private_association_2" {
  subnet_id      = "${aws_subnet.int_private_subnet2.id}"
  route_table_id = "${aws_route_table.int_private_rt.id}"
}

resource "aws_route" "int_igw" {
  route_table_id            = "${aws_route_table.int_public_rt.id}"
  destination_cidr_block    = "${var.env["full_cidr"]}"
  gateway_id                = "${aws_internet_gateway.int_igw.id}"
}

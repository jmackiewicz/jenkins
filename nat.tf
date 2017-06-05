resource "aws_nat_gateway" "int_nat" {
  allocation_id = "${aws_eip.int_nat_eip.id}"
  subnet_id     = "${aws_subnet.int_public_subnet.id}"
  depends_on = ["aws_internet_gateway.int_igw"]
}

resource "aws_eip" "int_nat_eip" {
  vpc      = true
}

resource "aws_route" "int_nat_rt" {
  route_table_id = "${aws_route_table.int_private_rt.id}"
  destination_cidr_block = "${var.env["full_cidr"]}"
  nat_gateway_id = "${aws_nat_gateway.int_nat.id}"
}

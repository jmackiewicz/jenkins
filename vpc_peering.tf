resource "aws_vpc_peering_connection" "int2mgmt" {
  peer_vpc_id = "${data.aws_vpc.mgmt_vpc.id}"
  vpc_id      = "${aws_vpc.int_vpc.id}"
  auto_accept = true

  tags {
    Name        = "int2mgmt"
    Project     = "${var.env["project_name"]}"
    Environment = "${var.env["environment"]}"
  }
}

data "aws_vpc" "mgmt_vpc" {
  tags {
    Name        = "mgmt_vpc"
    Project     = "${var.env["project_name"]}"
  }
}

resource "aws_route" "mgmtroute" {
  route_table_id            = "${aws_route_table.int_private_rt.id}"
  destination_cidr_block    = "${data.aws_vpc.mgmt_vpc.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.int2mgmt.id}"
}

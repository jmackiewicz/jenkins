resource "aws_security_group" "int_nginx_sg" {
  name        = "int_nginx_sg"
  description = "Security group for int_nginx"
  vpc_id      = "${aws_vpc.int_vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.env["full_cidr"]}"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_instance.mgmt_jumphost-1.private_ip}/32","${data.aws_instance.mgmt_ci-1.private_ip}/32"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["${var.env["int_public_cidr"]}"]
  }

  tags {
    Environment = "${var.env["environment"]}"
    Name       = "int_nginx_sg"
    Project    = "${var.env["project_name"]}"
  }
}

resource "aws_security_group" "int_mysql_sg" {
  name        = "int_mysql_sg"
  description = "Security group for int_mysql"
  vpc_id      = "${aws_vpc.int_vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.env["full_cidr"]}"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_instance.mgmt_jumphost-1.private_ip}/32","${data.aws_instance.mgmt_ci-1.private_ip}/32"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${var.env["int_private_cidr2"]}"]
  }

  tags {
    Name = "int_mysql_sg"
  }
}

resource "aws_security_group" "int_elb_nginx_sg" {
  name        = "int_elb_nginx_sg"
  description = "Security group for elb_int_nginx"
  vpc_id      = "${aws_vpc.int_vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.env["full_cidr"]}"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.env["gdansk_office_ip"]}"]
  }

  tags {
    Environment = "${var.env["environment"]}"
    Name       = "int_elb_nginx_sg"
    Project    = "${var.env["project_name"]}"
  }
}

resource "aws_security_group" "int_elb_mysql_sg" {
  name        = "int_elb_mysql_sg"
  description = "Security group for elb_int_mysql"
  vpc_id      = "${aws_vpc.int_vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.env["full_cidr"]}"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${var.env["int_private_cidr1"]}"]
  }

  tags {
    Environment = "${var.env["environment"]}"
    Name       = "int_elb_mysql_sg"
    Project    = "${var.env["project_name"]}"
  }
}

data "aws_instance" "mgmt_jumphost-1" {

  filter {
    name   = "tag:Name"
    values = ["mgmt_jumphost-1"]
  }
}

data "aws_instance" "mgmt_ci-1" {

  filter {
    name   = "tag:Name"
    values = ["mgmt_ci-1"]
  }
}

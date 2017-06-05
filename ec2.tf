resource "aws_instance" "int_nginx-1" {
  ami                    = "${data.aws_ami.centos7.image_id}"
  instance_type          = "${var.env["instance_type"]}"
  subnet_id              = "${aws_subnet.int_private_subnet1.id}"
  vpc_security_group_ids = ["${aws_security_group.int_nginx_sg.id}"]

  tags {
    Environment = "${var.env["environment"]}"
    Name        = "int_nginx-1"
    Project     = "${var.env["project_name"]}"
    NodeRole   = "webserver"
  }
}

resource "aws_instance" "int_nginx-2" {
  ami                    = "${data.aws_ami.centos7.image_id}"
  instance_type          = "${var.env["instance_type"]}"
  subnet_id              = "${aws_subnet.int_private_subnet1.id}"
  vpc_security_group_ids = ["${aws_security_group.int_nginx_sg.id}"]

  tags {
    Environment = "${var.env["environment"]}"
    Name        = "int_nginx-2"
    Project     = "${var.env["project_name"]}"
    NodeRole   = "webserver"
  }
}

resource "aws_instance" "int_mysql-1" {
  ami                    = "${data.aws_ami.centos7.image_id}"
  instance_type          = "${var.env["instance_type"]}"
  subnet_id              = "${aws_subnet.int_private_subnet2.id}"
  vpc_security_group_ids = ["${aws_security_group.int_mysql_sg.id}"]
  depends_on             = ["aws_nat_gateway.int_nat"]

  tags {
    Environment = "${var.env["environment"]}"
    Name        = "int_mysql-1"
    Project     = "${var.env["project_name"]}"
    NodeRole   = "database"
  }
}

resource "aws_instance" "int_mysql-2" {
  ami                    = "${data.aws_ami.centos7.image_id}"
  instance_type          = "${var.env["instance_type"]}"
  subnet_id              = "${aws_subnet.int_private_subnet2.id}"
  vpc_security_group_ids = ["${aws_security_group.int_mysql_sg.id}"]
  depends_on             = ["aws_nat_gateway.int_nat"]

  tags {
    Environment = "${var.env["environment"]}"
    Name        = "int_mysql-2"
    Project     = "${var.env["project_name"]}"
    NodeRole   = "database"
  }
}

data "aws_ami" "centos7" {
  owners      = ["self"]
  most_recent = true
  name_regex  = "packer-woa5pl-centos-7.3.1611-AMI"
}

resource "aws_elb" "int-elb-nginx" {
  name               = "int-elb-nginx"

  access_logs {
    bucket        = "woa5pl"
    bucket_prefix = "access_logs"
    interval      = 60
  }

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:8080"
    interval            = 30
  }

  instances                   = ["${aws_instance.int_nginx-1.id}", "${aws_instance.int_nginx-2.id}"]
  cross_zone_load_balancing   = false
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  subnets                     = ["${aws_subnet.int_public_subnet.id}"]
  security_groups             = ["${aws_security_group.int_elb_nginx_sg.id}"]

  tags {
    Name        = "int-elb-nginx"
    Project     = "${var.env["project_name"]}"
    Environment = "${var.env["environment"]}"
  }
}

resource "aws_elb" "int-elb-mysql" {
  name               = "int-elb-mysql"

  access_logs {
    bucket        = "woa5pl"
    bucket_prefix = "access_logs"
    interval      = 60
  }

  listener {
    instance_port     = 3306
    instance_protocol = "tcp"
    lb_port           = 3306
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:3306"
    interval            = 30
  }

  instances                   = ["${aws_instance.int_mysql-1.id}", "${aws_instance.int_mysql-2.id}"]
  cross_zone_load_balancing   = false
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  subnets                     = ["${aws_subnet.int_private_subnet2.id}"]
  internal                    = true
  security_groups             = ["${aws_security_group.int_elb_mysql_sg.id}"]

  tags {
    Name        = "int-elb-mysql"
    Project     = "${var.env["project_name"]}"
    Environment = "${var.env["environment"]}"
  }
}

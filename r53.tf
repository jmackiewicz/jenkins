resource "aws_route53_zone" "int_woa5pl" {
  name   = "int.aws.woa5pl"
  vpc_id = "${aws_vpc.int_vpc.id}"

  tags {
    Environment = "${var.env["environment"]}"
    Name       = "int_woa5pl zone"
    Project    = "${var.env["project_name"]}"
  }
}

resource "aws_route53_record" "nginx-1" {
  zone_id = "${aws_route53_zone.int_woa5pl.zone_id}"
  name    = "nginx-1.int.aws.woa5pl"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.int_nginx-1.private_ip}"]
}

resource "aws_route53_record" "nginx-2" {
  zone_id = "${aws_route53_zone.int_woa5pl.zone_id}"
  name    = "nginx-2.int.aws.woa5pl"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.int_nginx-2.private_ip}"]
}

resource "aws_route53_record" "int-elb-mysql" {
  zone_id = "${aws_route53_zone.int_woa5pl.zone_id}"
  name    = "mysql-elb.int.aws.woa5pl"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_elb.int-elb-mysql.dns_name}"]
}

resource "aws_route53_record" "mysql-1" {
  zone_id = "${aws_route53_zone.int_woa5pl.zone_id}"
  name    = "mysql-1.int.aws.woa5pl"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.int_mysql-1.private_ip}"]
}

resource "aws_route53_record" "mysql-2" {
  zone_id = "${aws_route53_zone.int_woa5pl.zone_id}"
  name    = "mysql-2.int.aws.woa5pl"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.int_mysql-2.private_ip}"]
}

resource "aws_route53_zone_association" "int2mgmt_dns_zone" {
  zone_id = "${aws_route53_zone.int_woa5pl.zone_id}"
  vpc_id  = "${data.aws_vpc.mgmt_vpc.id}"
}

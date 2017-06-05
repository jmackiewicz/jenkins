terraform {
  backend "s3" {
    bucket = "woa5pl"
    key    = "tfstates/int/terraform.tfstate"
    region = "eu-west-1"
  }

  tags {
    Enviroment = "${var.env["environment"]}"
    Name       = "int_s3_backend"
    Project    = "${var.env["project_name"]}"
  }
}

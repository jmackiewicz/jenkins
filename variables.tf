variable "env" {
  default = {
    region                    = "eu-west-1"
    availability_zone         = "eu-west-1a"
    vpc_cidr                  = "10.20.0.0/16"
    int_public_cidr           = "10.20.0.0/24"
    int_private_cidr1         = "10.20.1.0/24"
    int_private_cidr2         = "10.20.2.0/24"
    full_cidr                 = "0.0.0.0/0"
    gdansk_office_ip          = "91.222.71.98/32"
    project_name              = "woa5pl"
    instance_type             = "t2.micro"
    template_ssh_config_file  = "ssh_config"
    environment               = "int"
    ssh_common_args           = "-o StrictHostKeyChecking=no"
  }
}

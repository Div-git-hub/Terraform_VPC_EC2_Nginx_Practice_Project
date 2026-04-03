module "VPC" {
    source = "./Module/VPC"
    vpc_cidr = var.vpc_cidr
    subnet_cidr = var.subnet_cidr
    route_cidr = var.route_cidr
}


module "EC2" {
    source = "./Module/EC2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_id = module.VPC.vpc_id
    subnet_id = module.VPC.subnet_id
    region = var.region

  
}



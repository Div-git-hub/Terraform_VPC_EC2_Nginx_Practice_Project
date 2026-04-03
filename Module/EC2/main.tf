
resource "aws_security_group" "ec2_asg" {


  name = "ec2_asg"
  description = "allow SSH and HTTP"
  vpc_id = var.vpc_id

  ingress {

    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {

    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    
  egress {

    //description = "SSH"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "aws_instance" "ec2" {

    

    ami = var.ami_id
    instance_type = var.instance_type
    region = var.region
    subnet_id = var.subnet_id
    key_name = var.key_name
    //vpc-id = var.vpc_id
    vpc_security_group_ids = [aws_security_group.ec2_asg.id]
    associate_public_ip_address = true
  user_data = file("${path.module}/../../scripts/install_nginx.sh")

  tags = {
    "name" = "ec2-instance" 
  }

}

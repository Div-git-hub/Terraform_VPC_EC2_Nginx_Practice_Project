resource "aws_vpc" "main_vpc" {

    
    cidr_block = var.vpc_cidr
     
     tags = {
  Name = "my-vpc-dev-prod"
}
    
}

resource "aws_subnet" "public_subnet" {

    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.subnet_cidr
    map_public_ip_on_launch = true   
    //availability_zone = var.region
  
}

resource "aws_internet_gateway" "igw" {

    vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table" "rt" {
    
    vpc_id = aws_vpc.main_vpc.id

  
}
resource "aws_route" "internet" {

    route_table_id = aws_route_table.rt.id
    destination_cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.igw.id

  
}
resource "aws_route_table_association" "assoc" {


    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.rt.id

    
    
}




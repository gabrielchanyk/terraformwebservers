# Specify the provider and access details
provider "aws" {
  region = var.aws_region
  access_key    = var.aws_access_key
  secret_key    = var.aws_secret_key
}

resource "aws_vpc" "final_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
     tags = {
         Name = "final-terraform-vpc"
     }
}

/*
  Public Subnets
*/

//Public Subnet 1
resource "aws_subnet" "public_subnet1" {
    vpc_id = aws_vpc.final_vpc.id

    cidr_block = var.public_subnet1_cidr
    availability_zone = "${lookup(var.az1, var.aws_region)}"

     tags = {
         Name = "Public Subnet1"
     }
}
// Public Subnet 2
resource "aws_subnet" "public_subnet2" {
    vpc_id = aws_vpc.final_vpc.id

    cidr_block = var.public_subnet2_cidr
    availability_zone = "${lookup(var.az2, var.aws_region)}"

     tags = {
         Name = "Public Subnet2"
     }
}

/*
  Private Subnets
*/
//Private Subnet 1
resource "aws_subnet" "private_subnet1" {
    vpc_id = aws_vpc.final_vpc.id

    cidr_block = var.private_subnet1_cidr
    availability_zone = "${lookup(var.az1, var.aws_region)}"

    tags = {
         Name = "Private Subnet1"
    }
}
//Private Subnet 2
resource "aws_subnet" "private_subnet2" {
    vpc_id = aws_vpc.final_vpc.id

    cidr_block = var.private_subnet2_cidr
    availability_zone = "${lookup(var.az2, var.aws_region)}"

     tags = {
         Name = "Private Subnet2"
     }
}
//IGW
resource "aws_internet_gateway" "gateway" {
    vpc_id = aws_vpc.final_vpc.id
}
//Public Route Table
resource "aws_route_table" "publicRT" {
    vpc_id = aws_vpc.final_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gateway.id
    }

     tags = {
         Name = "Route to ELB"
     }
}

resource "aws_route_table_association" "publicrt" {
    subnet_id = aws_subnet.public_subnet1.id
    route_table_id = aws_route_table.publicRT.id
}

resource "aws_route_table_association" "publicrt2" {
    subnet_id = aws_subnet.public_subnet2.id
    route_table_id = aws_route_table.publicRT.id
}

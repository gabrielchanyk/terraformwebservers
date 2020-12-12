variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    //default = "ca-central-1"
    default = "us-west-1"
}

variable "ami1" {
    description = "AMIs by region"
    default = {
        ca-central-1 = "ami-0635bf058238a9721"
        us-west-1 = "ami-01e2325824f79fcfc"
    }
}

variable "ec2_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}

variable "ami2" {
    description = "AMIs by region"
    default = {
        ca-central-1 = "ami-09eca3f5711ea91b7"
        us-west-1 = "ami-092a1c652fcfe3f77"
    }
}

variable "az1"{
    description = "avaiability zone"
    default = {
        ca-central-1 = "ca-central-1a"
        us-west-1 = "us-west-1b"
    }
}
variable "az2"{
    description = "avaiability zone"
    default = {
        ca-central-1 = "ca-central-1b"
        us-west-1 = "us-west-1c"
    }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}


variable "public_subnet1_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}

variable "public_subnet2_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.1.0/24"
}

variable "private_subnet1_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.2.0/24"
}

variable "private_subnet2_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.3.0/24"
}



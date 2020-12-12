//Web Server 1
resource "aws_instance" "web-1" {
    ami = "${lookup(var.ami1, var.aws_region)}"
    availability_zone = "${lookup(var.az1, var.aws_region)}"
    instance_type = var.ec2_type
    key_name = var.aws_key_name
    vpc_security_group_ids = ["${aws_security_group.web.id}"]
    subnet_id = aws_subnet.private_subnet1.id
    associate_public_ip_address = false
    source_dest_check = true

     tags = {
         Name = "Web Server 1"
     }
}
//Security Group for Web Server
resource "aws_security_group" "web" {
    name = "vpc_web"
    description = "Allow incoming HTTP connections."

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = ["${aws_security_group.ELB_SG.id}"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = aws_vpc.final_vpc.id

     tags = {
         Name = "Security Group for VPC"
     }
}

//Web Server 2
resource "aws_instance" "web-2" {
    ami = "${lookup(var.ami2, var.aws_region)}"
    availability_zone = "${lookup(var.az2, var.aws_region)}"
    instance_type = var.ec2_type
    key_name = var.aws_key_name
    vpc_security_group_ids = ["${aws_security_group.web.id}"]
    subnet_id = aws_subnet.private_subnet2.id
    associate_public_ip_address = false
    source_dest_check = true

     tags = {
         Name = "Web Server 2"
     }
}


//ELB
resource "aws_elb" "final" {
  name = "final-elb"
  subnets = ["${aws_subnet.public_subnet1.id}", "${aws_subnet.public_subnet2.id}"]
  security_groups = ["${aws_security_group.ELB_SG.id}"]
  instances = ["${aws_instance.web-1.id}", "${aws_instance.web-2.id}"]

  # Listen for HTTP requests and distribute them to the instances
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"

  }
}
  //Security Group for ELB
resource "aws_security_group" "ELB_SG" {
    name = "ELB_SG"
    description = "Allow incoming HTTP connections."

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    vpc_id = aws_vpc.final_vpc.id

     tags = {
         Name = "Security Group for ELB"
     }
}

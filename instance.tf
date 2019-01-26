########## CREATING THE SECURITY GROUPS AND AN AMAZON EC2 INSTANCE #############
resource "aws_security_group" "sgweb" {
  name = "vpc_test_web"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 2377
    to_port = 2377
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks =  ["0.0.0.0/0"]
  }


  vpc_id="${aws_vpc.main.id}"

  tags {
    Name = "Web Server SG"
  }
}


resource "aws_instance" "Bastion_host" {
#resource "aws_spot_instance_request" "Bastion_host1" {
   ami  = "ami-0080e4c5bc078760e"
#   spot_price = "0.0155"
   instance_type = "t2.micro"
   key_name = "virginia-key"
   private_ip = "10.34.0.56"
   subnet_id = "${aws_subnet.in_secondary_cidr.id}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = true
   source_dest_check = false

  tags {
    Name = "casestudy"
  }
}












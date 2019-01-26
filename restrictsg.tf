######## SECURITY RESTRICTION FOR IP ADDRESSESS ####################

resource "aws_security_group" "restrict_all" {
  name        = "restrict_ip"
  description = "restrict the acess for the particular ip addressess"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["xx.yy.zz.ww/32"]
  }

}


resource "aws_security_group" "restrict_all01" {
  name        = "restrict_ip02"
  description = "restrict the acess for the particular ip addressess"
  vpc_id      = "${aws_vpc.main.id}"
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["aa.bb.cc.dd/32"]
  }
    
} 



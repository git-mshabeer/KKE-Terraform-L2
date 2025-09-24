resource "aws_vpc" "xfusion_priv_vpc" {
  cidr_block = var.KKE_VPC_CIDR
  tags = {
    Name = "xfusion-priv-vpc"
  }
}

resource "aws_subnet" "xfusion_priv_subnet" {
  vpc_id                  = aws_vpc.xfusion_priv_vpc.id
  cidr_block              = var.KKE_SUBNET_CIDR
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "xfusion-priv-subnet"
  }
}


resource "aws_security_group" "priv_sg" {
  vpc_id = aws_vpc.xfusion_priv_vpc.id
  name   = "priv-sg"

  ingress {
    description = "Allow traffic only from within the VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.KKE_VPC_CIDR]
  }

  egress {
    description = "Allow all outbound within VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.KKE_VPC_CIDR]
  }

  tags = {
    Name = "priv-sg"
  }
}


resource "aws_instance" "xfusion_priv_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 (us-east-1 example)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.xfusion_priv_subnet.id
  vpc_security_group_ids = [aws_security_group.priv_sg.id]

  tags = {
    Name = "xfusion-priv-ec2"
  }
}
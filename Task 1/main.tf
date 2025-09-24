resource "aws_vpc" "xfusion_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.KKE_VPC_NAME
  }
}

resource "aws_subnet" "xfusion_subnet" {
  vpc_id                  = aws_vpc.xfusion_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = var.KKE_SUBNET_NAME
  }


  depends_on = [aws_vpc.xfusion_vpc]
}

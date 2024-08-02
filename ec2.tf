#Default VPC
data "aws_vpc" "default" {
  default = true
}

#Default subnet
data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

#Latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux2" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "amazon_linux" {
  ami           = data.aws_ami.amazon_linux2.id
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnets.default_subnets.ids[0]

  tags = {
    Name = "Terraform-AL2-Instance"
  }
}
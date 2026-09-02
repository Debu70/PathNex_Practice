# for Default VPC
data "aws_default_VPC" "own_default_VPC" {
    default = true
}

# for AMI config
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = [ "137112412989" ]
=======
#For Default Security Group

data "aws_default_SG" "default_SG" {
  name = "default_SG"
  vpc_id = "aws_default_VPC.own_default_VPC.id"
}


  filter {
    name = "name"
    values = [ "al2023-ami-*-x86_64" ]
  }

  filter {
    name = "state"
    values = [ "available" ]
  }

}

#for EC2
resource "aws_EC2" "own_EC2" {
  
  ami = data.aws_ami.amazon_linux.vpc_id
  instace_type = var.instace_type
  key_name = var.key_name

  vpc_security_group_ids =[
    data.aws_default_VPC.own_default_VPC.id
  ]

  associate_public_ip_address = true

  tags = {
    name = "EC2-Terraform"
  }
}
# for Default VPC
data "aws_default_VPC" "own_default_VPC" {
    default = true
}

#For Default Security Group

data "aws_default_SG" "default_SG" {
  name = "default_SG"
  vpc_id = "aws_default_VPC.own_default_VPC.id"
}




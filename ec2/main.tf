provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2" {
    ami="ami-067d1e60475437da2"
    instance_type = "t2.micro"
}

resource "aws_eip" "eip" {
  instance = aws_instance.ec2.id
}

output "eipoutput" {
    value = aws_eip.eip.public_ip
}

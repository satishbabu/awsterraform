provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2" {
    ami="ami-067d1e60475437da2"
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.webtraffic.name ]
}

resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"
    ingress = [{
        description      = "Allow HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = null
        prefix_list_ids  = null
        security_groups  = null
        self             = null
    }]

    egress = [{
        description      = "Allow HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = null
        prefix_list_ids  = null
        security_groups  = null
        self             = null
   }]
}

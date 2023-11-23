provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
    ami="ami-067d1e60475437da2"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.web_traffic.name]

    user_data = <<-EOF
        #!/bin/bash
        sudo yum update
        sudo yum install -y httpd
        sudo systemctl start httpd
        sudo systemctl enable httpd
        echo "<h1>Hello from Terraform</h1>" | sudo tee /var/www/html/index.html
        EOF

    tags = {
        Name = "Web Server"
    }
}

resource "aws_eip" "web_ip" {
    instance = aws_instance.web.id
}

variable "ingress" {
    type = list(number)
    default = [80,443,22]
}

variable "egress" {
    type = list(number)
    default = [80,443,22]
}

resource "aws_security_group" "web_traffic" {
    name = "Allow Web Traffic to Web Server"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress
        content {
          from_port = port.value
          to_port = port.value
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egress
        content {
          from_port = port.value
          to_port = port.value
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

output "PublicIP" {
    value = aws_eip.web_ip.public_ip
}

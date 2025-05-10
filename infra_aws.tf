provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical (dono oficial das AMIs Ubuntu)
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io git
              systemctl start docker
              usermod -aG docker ubuntu
              cd /home/ubuntu
              git clone https://github.com/Gus1101/api_docker_terraform_api_code.git app
              cd app
              docker build -t api_docker_terraform_api_code_image .
              docker run -d -p 8000:8000 --name api_docker_terraform_api_code_container api_docker_terraform_api_code_image
              chown -R ubuntu:ubuntu /home/ubuntu/app
              EOF

  tags = {
    Name = "UbuntuDockerApp"
  }
}

output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

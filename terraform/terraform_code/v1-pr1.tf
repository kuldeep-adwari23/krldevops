provider "aws" {
region  = "us-east-1"
}
resource "aws_instance" "demo-server" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  key_name      = "dpp"
  security_groups = ["demo-sg"]
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "ssh connection"


  ingress {
    description = "ssh connection"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-prot"
  }
}

# resource "aws_instance" "demo-server" {
#   ami           = "ami-0453ec754f44f9a4a"
#   instance_type = "t2.micro"
#   key_name      = "dpp"
# }

# provider "aws" {
#   region = "us-east-1"
#   }

# resource "aws_security_group" "allow_ssh" {
#   name        = "allow_ssh"
#   description = "Allow SSH access"
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_instance" "demo-server" {
#   ami           = "ami-0453ec754f44f9a4a"
#   instance_type = "t2.micro"
#   key_name      = "dpp"
#   security_groups = [aws_security_group.allow_ssh.name]  # Attach the security group
# }


resource "aws_key_pair" "my_key" {
  key_name   = "rahul-key-pair"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Security group for web server"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-server-sg-rahul"
  }
}
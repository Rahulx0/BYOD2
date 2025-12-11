

resource "aws_instance" "web_server" {
  ami                    = "ami-03f9680ef0c07a3d1"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Project Genesis SUCCESS! Deployed by Rahul</h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "web-server-rahul"
  }
}
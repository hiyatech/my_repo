provider "aws"{
region = "ap-south-1"
}

resource "aws_instance" "web"{
ami = "ami-0c3d1e0f8ec487d6d"
instance_type = "t3.micro"

key_name = "mykey"

user_data = <<-EOF
#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "<h1>Terraform web server</h1>" > /var/www/html/index.html
EOF

tags = {
Name = "Terraform-server"
}
}
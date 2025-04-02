resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags       = { Name = "MainVPC" }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags                    = { Name = "PublicSubnet" }
}

resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "AllowSSH" }
}

resource "aws_instance" "web" {
  ami             = "ami-12345678"
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.allow_ssh.name]
  tags            = { Name = "WebServer" }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"
  tags   = { Name = "MyBucket" }
}

resource "aws_db_instance" "mydb" {
  identifier          = "mydb-instance"
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  allocated_storage   = 20
  username            = var.db_username
  password            = var.db_password
  publicly_accessible = false
  skip_final_snapshot = true
  tags                = { Name = "MyDatabase" }
}
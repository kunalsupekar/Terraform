

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch =  true

  tags = {
    Name = "Main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "public-route-table-terraform" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags ={ 
    Name = "public-route-table-terraform"
  }
}



resource "aws_route_table_association" "aws_route_table_association" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.public-route-table-terraform.id
  
}

resource "aws_security_group" "aws_security_group" {
  name        = "allow_ssh_http_https"
  description = "Allow SSH, HTTP and HTTPS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic"
  } 
  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]   
  }
}

resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.aws_security_group.id]
  key_name = "test"
  tags = {
    Name = "MyInstance"
  }
  associate_public_ip_address = true
  user_data= file("userdata.sh")

}



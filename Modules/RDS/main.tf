resource "aws_db_subnet_group" "this" {
  name       = var.db_subnet_group_name
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_instance" "this" {
  identifier              = var.db_identifier
  allocated_storage       = var.storage
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  username                = var.username
  password                = var.password
  skip_final_snapshot     = true
  publicly_accessible     = false
  vpc_security_group_ids  = [var.db_sg_id]
  db_subnet_group_name    = aws_db_subnet_group.this.name

  tags = {
    Name = var.db_identifier
  }
}

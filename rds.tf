# create database subnet group
resource "aws_db_subnet_group" "database_subnet_group" {
  name        = 
  subnet_ids  = 
  description = 

  tags = {
    Name = 
  }
}

# create the rds instance
resource "aws_db_instance" "database_instance" {
  engine                 = 
  engine_version         = 
  multi_az               = 
  identifier             = 
  username               = 
  password               = 
  db_name                = 
  instance_class         = 
  allocated_storage      = 
  db_subnet_group_name   = 
  vpc_security_group_ids = 
  availability_zone      = 
  skip_final_snapshot    = 
  publicly_accessible    = 
}

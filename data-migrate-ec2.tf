resource "aws_instance" "data_migrate_ec2" {
  ami                    = 
  instance_type          = 
  subnet_id              = 
  vpc_security_group_ids = 
  iam_instance_profile   = 

  user_data = base64encode(templatefile("${path.module}/<enter the name of your script here>", {
    RDS_ENDPOINT = 
    RDS_DB_NAME  = 
    USERNAME     = 
    PASSWORD     = 
  }))

  depends_on = [aws_db_instance.database_instance]

  tags = {
    Name = 
  }
}

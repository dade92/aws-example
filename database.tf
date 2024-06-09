resource "aws_db_instance" "default" {
  identifier          = "my-test-db"
  allocated_storage   = 10
  engine              = "mysql"
  engine_version      = "5.7"
  instance_class      = "db.t3.micro"
  username            = "root"
  password            = "password"
  skip_final_snapshot = true // required to destroy
  db_name             = "rdsTest"

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.my_db_subnet_group.name
}
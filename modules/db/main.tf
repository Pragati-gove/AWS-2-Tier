resource "aws_db_subnet_group" "rds" {
  name       = "${var.project}-rds-subnet-group"
  subnet_ids = var.private_db_subnet_ids
  tags = {
    Name = "${var.project}-rds-subnet-group"
  }
}

resource "aws_db_instance" "main" {
  identifier                = "${var.project}-rds"
  engine                    = "mariadb"
  engine_version            = "11.8.6"
  instance_class            = "db.t3.micro"
  allocated_storage         = 20
  max_allocated_storage     = 100
  storage_encrypted         = true
  db_name                   = var.db_name
  username                  = var.db_username
  password                  = var.db_password
  db_subnet_group_name      = aws_db_subnet_group.rds.name
  vpc_security_group_ids    = [var.rds_sg_id]
  multi_az                  = false
  backup_retention_period   = 7
  deletion_protection       = false
  skip_final_snapshot       = false
  final_snapshot_identifier = "${var.project}-final-snapshot"
  tags                      = { Name = "${var.project}-rds" }

}
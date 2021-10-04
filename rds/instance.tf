resource "aws_db_instance" "db" {
  identifier                  = var.name
  allocated_storage           = var.allocated_storage
  engine                      = "postgres"
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  username                    = var.username
  password                    = var.password
  allow_major_version_upgrade = true
  availability_zone           = var.availability_zone
  port                        = var.port
  db_subnet_group_name        = var.db_subnet_group_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  publicly_accessible         = var.publicly_accessible
  skip_final_snapshot         = true
  tags = {
    Name        = var.name
    Project     = var.project
    Description = var.description
  }
}

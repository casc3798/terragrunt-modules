variable "name" {
    description = "Name of the database"
}

variable "allocated_storage" {
    description = "GiB of allocated storage for this database"
    type = number
}

variable "engine_version" {
    description = "Version of the PostgreSQL database"
}

variable "instance_class" {
    description = "Size of the rds instance"
}

variable "username" {
    description = "Username for the db administrator"
}

variable "password" {
    description = "Password for the db administrator"
}

variable "availability_zone" {
    description = "Availability zone fot this database"
}

variable "port" {
    description = "Database port. PostgreSQL default: 5432"
    type = number
}

variable "db_subnet_group_name" {
    description = "VPC name"
}

variable "vpc_security_group_ids" {
    description = "List of VPC security groups to associate."
    type = list(string)
}

variable "project" {
    description = "Project that the database is part of"
}

variable "description" {
    description = "Description of the database"
}

variable "publicly_accessible" {
    description = "Is publicly accessible?"
    type = bool
}
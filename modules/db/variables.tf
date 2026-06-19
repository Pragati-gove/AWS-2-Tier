variable "project" {}

variable "private_db_subnet_ids" {}

variable "rds_sg_id" {}

variable "db_name" {}

variable "db_username" {}

variable "db_password" {
  sensitive = true
}
variable "vpc_id" {

}
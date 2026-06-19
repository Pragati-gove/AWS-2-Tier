variable "aws_region" {
  default = "ap-south-1"

}
variable "project" {
  default = "myapp"

}
variable "vpc_cidr" {
  default = "10.0.0.0/16"

}
variable "azs" {
  default = ["ap-south-1a", "ap-south-1b"]

}
variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]

}
variable "private_db_subnets" {
  default = ["10.0.21.0/24", "10.0.22.0/24"]

}
variable "ami_id" {
  default     = "ami-0e38835daf6b8a2b9"
  
}

variable "instance_type" {
  default = "t3.micro"
}

variable "db_name" {
  default = "appdb"

}

variable "db_username" {
  default = "dbadmin"

}
variable "db_password" { sensitive = true }

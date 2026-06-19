output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "web_ec2_sg_id" {
  value = aws_security_group.web_ec2.id
}

output "rds_sg_id" {
  value = aws_security_group.rds.id
}
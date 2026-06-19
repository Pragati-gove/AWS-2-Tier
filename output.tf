output "alb_dns_name" {
  value       = module.web.alb_dns_name
  description = "Paste this into your browser to test"
}
output "rds_endpoint" {
  value     = module.db.rds_endpoint
  sensitive = true
}
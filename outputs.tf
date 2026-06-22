output "e-commerce_alb_dns_name" {
  description = "DNS del Application Load Balancer"
  value = "http://${module.loadbalancer.alb_dns_name}"
}

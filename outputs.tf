output "alb_domain_name" {
  description = "ALB domain name"
  value       = "${data.aws_alb.default.dns_name}"
}

output "alb_domain_zone_id" {
  description = "ALB domain zone id for Route 53 alias record"
  value       = "${data.aws_alb.default.zone_id}"
}

output "target_group_arn" {
  description = "The target group ARN."
  value       = "${aws_alb_target_group.default.arn}"
}

output "name" {
  value = "${var.name}"
}
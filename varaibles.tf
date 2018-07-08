variable "hostnames" {
  type = "list"
}

variable "port" {
  description = "The port on which targets receive traffic, unless overridden when registering a specific target."
  default     = 80
}

variable "protocol" {
  description = "The protocol to use for routing traffic to the targets."
  default     = "HTTP"
}

variable "deregistration_delay" {
  description = "The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused."
  default     = 300
}

variable "slow_start_duration" {
  description = "The amount time for targets to warm up before the load balancer sends them a full share of requests."
  default     = 0
}

variable "target_type" {
  description = "The type of target that you must specify when registering targets with this target group."
  default     = "instance"
}

variable "stickness" {
  description = "Define if requests from a client should be routed to the same target."
  default     = true
}

variable "stickness_duration" {
  description = "The time period, in seconds, during which requests from a client should be routed to the same target."
  default     = 86400
}

variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target."
  default     = 30
}

variable "health_check_path" {
  description = "The destination for the health check request."
}

variable "health_check_port" {
  description = "The port to use to connect with the target."
  default     = "traffic-port"
}

variable "health_check_protocol" {
  description = "The protocol to use to connect with the target."
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check."
  default     = 5
}

variable "health_check_healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy."
  default     = 3
}

variable "health_check_unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy."
  default     = 3
}

variable "health_check_matcher" {
  description = "The HTTP codes to use when checking for a successful response from a target. You can specify multiple values (for example, '200,202') or a range of values (for example, '200-299')."
  default     = "200-304"
}

variable "loadbalancer_arn" {
  description = "The ARN of the loadbalancer to which to attach the rule."
}

data "aws_alb_listener" "default" {
  load_balancer_arn = "${var.loadbalancer_arn}"
  port              = "${var.port}"
}

data "aws_alb" "default" {
  arn = "${data.aws_alb_listener.default.load_balancer_arn}"
}

locals {
  vpc_id = "${data.aws_alb.default.vpc_id}"
}

variable "name" {
  description = "The target group name"
}

variable "certificate_arn" {
  description = "The ARN of the certificate to attach to the listener."
  default = ""
}
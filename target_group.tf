resource "aws_alb_target_group" "default" {
  name                 = "${var.name}"
  port                 = "${var.port}"
  protocol             = "${var.protocol}"
  vpc_id               = "${local.vpc_id}"
  deregistration_delay = "${var.deregistration_delay}"
  slow_start           = "${var.slow_start_duration}"
  target_type          = "${var.target_type}"

  stickiness {
    type            = "lb_cookie"
    cookie_duration = "${var.stickness_duration}"
    enabled         = "${var.stickness}"
  }

  health_check {
    interval            = "${var.health_check_interval}"
    path                = "${var.health_check_path}"
    port                = "${var.health_check_port}"
    protocol            = "${var.health_check_protocol}"
    timeout             = "${var.health_check_timeout}"
    healthy_threshold   = "${var.health_check_healthy_threshold}"
    unhealthy_threshold = "${var.health_check_unhealthy_threshold}"
    matcher             = "${var.health_check_matcher}"
  }

}
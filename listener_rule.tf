resource "aws_alb_listener_rule" "default" {

  action {
    target_group_arn = "${aws_alb_target_group.default.arn}"
    type = "forward"
  }

  condition {
    field  = "host-header"
    values = ["${var.hostnames}"]
  }

  listener_arn = "${data.aws_alb_listener.default.arn}"
}

resource "aws_alb_listener_rule" "default" {
  count = "${length(var.hostnames)}"

  action {
    target_group_arn = "${aws_alb_target_group.default.arn}"
    type = "forward"
  }

  condition {
    field  = "host-header"
    values = ["${list(replace(element(var.hostnames, count.index), ".xn--p1ai" , ".*"))}"] // "replace" is a w/a to support russian IDN tld
  }

  listener_arn = "${data.aws_alb_listener.default.arn}"
}

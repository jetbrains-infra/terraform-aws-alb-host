resource "aws_alb_listener_certificate" "default" {
  count           = "${var.certificate_arn == "" ? 0 : 1}"
  certificate_arn = "${var.certificate_arn}"
  listener_arn    = "${data.aws_alb_listener.default.arn}"
}
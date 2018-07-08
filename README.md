## About
Terraform module to create target group and corresponding listener rule. 

Features: 
* Auto detect corresponding ALB listener by port

## Usage

Default:
```
module "example-host" {
  source            = "github.com/jetbrains-infra/terraform-aws-alb-host"
  name              = "example"
  hostnames         = ["example.com","*.example.com"]
  health_check_path = "/health"
  loadbalancer_arn  = "${aws_alb.default.arn}"
}
```

All params:
```
module "example-host" {
  source                           = "github.com/jetbrains-infra/terraform-aws-alb-host"
  name                             = "example"
  hostnames                        = ["example.com","*.example.com"]
  health_check_path                = "/health"
  loadbalancer_arn                 = "${aws_alb.default.arn}"
  port                             = 443
  protocol                         = "HTTPS"
  certificate_arn                  = "${module.certificate.arn}"
  deregistration_delay             = 300
  slow_start_duration              = 0
  target_type                      = "instance"
  stickness                        = true
  stickness_duration               = 86400
  health_check_port                = "traffic-port"
  health_check_protocol            = "HTTP"
  health_check_timeout             = 5
  health_check_interval            = 30
  health_check_matcher             = 200
  health_check_healthy_threshold   = 3
  health_check_unhealthy_threshold = 3
}
```
## Params

* `name` - The target group name.
* `hostnames` - List of hostnames.
* `health_check_path` - The destination for the health check request.
* `loadbalancer_arn` - The ARN of the loadbalancer to which to attach the rule.

### Optional params with default values

* `port` - The port on which targets receive traffic, unless overridden when registering a specific target (Default `443`).
* `protocol` - The protocol to use for routing traffic to the targets (Default `HTTPS`).
* `certificate_arn` - The ARN of the certificate to attach to the listener (Optional).
* `deregistration_delay` - The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused (Default `300`).
* `slow_start_duration` - The amount time for targets to warm up before the load balancer sends them a full share of requests (Default `0`).
* `target_type` - The type of target that you must specify when registering targets with this target group (Default `instance`).
* `stickness` - Define if requests from a client should be routed to the same target (Default `true`).
* `stickness_duration` - The time period, in seconds, during which requests from a client should be routed to the same target (Default `86400`).
* `health_check_interval` - The approximate amount of time, in seconds, between health checks of an individual target (Default `30`).
* `health_check_port` - The port to use to connect with the target (Default `traffic-port`).
* `health_check_protocol` - The protocol to use to connect with the target (Default `HTTP`).
* `health_check_timeout` - The amount of time, in seconds, during which no response means a failed health check (Default `5`).
* `health_check_healthy_threshold` - The number of consecutive health checks successes required before considering an unhealthy target healthy (Default `3`).
* `health_check_unhealthy_threshold` - The number of consecutive health check failures required before considering the target unhealthy (Default `3`).
* `health_check_matcher` - The HTTP codes to use when checking for a successful response from a target. You can specify multiple values (for example, '200,202') or a range of values (for example, '200-299') (Default `200`).

## Outputs

* `name` - The target group name.
* `target_group_arn` - The target group ARN.
* `alb_domain_name` - ALB domain name.
* `alb_domain_zone_id` - ALB domain zone id for Route 53 alias record.

resource "aws_lb" "webapp-lb" {
  name               = "webapp-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${allow_ssh_sg}","${allow_http_sg}"]
  subnets            = ["${public_subnet_1_id}","${public_subnet_2_id}"]

  enable_deletion_protection = true

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.bucket
#     prefix  = "test-lb"
#     enabled = true
#   }
  security_groups = ["${var.allow_ssh_sg}",${var.allow_http_sg}]
  tags = {
    Name = "webapp_alb"
    Environment = "webapp"
  }
}

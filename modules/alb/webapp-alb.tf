resource "aws_lb" "webapp-lb" {
  name               = "webapp-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.allow_ssh_sg}", "${var.allow_http_sg}"]
  subnets            = ["${var.public_subnet_1_id}", "${var.public_subnet_2_id}"]

  # enable_deletion_protection = true
  #   access_logs {
  #     bucket  = aws_s3_bucket.lb_logs.bucket
  #     prefix  = "webapp-lb"
  #     enabled = true
  #   }

  tags = {
    Name        = "webapp-lb"
    Environment = "webapp"
  }
}

resource "aws_alb_target_group" "webapp-target-group" {
  name     = "webapp-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  tags = {
    name = "webapp-target-group"
  }
  stickiness {
    type            = "lb_cookie"
    cookie_duration = 600
    enabled         = true
  }
  # health_check {    
  #   healthy_threshold   = 3
  #   unhealthy_threshold = 10
  #   timeout             = 5
  #   interval            = 10    
  #   path                = "${var.target_group_path}"    
  #   port                = "${var.target_group_port}"  
  # }
}

resource "aws_alb_listener" "webapp-lb-listener" {
  depends_on        = [aws_alb_target_group.webapp-target-group]
  load_balancer_arn = aws_lb.webapp-lb.arn
  port              = var.alb_listener_port
  protocol          = var.alb_listener_protocol

  default_action {
    target_group_arn = aws_alb_target_group.webapp-target-group.arn
    type             = "forward"
  }
}

# resource "aws_alb_listener_rule" "webapp-lb-listener-rule" {
#   depends_on   = [aws_alb_target_group.webapp-target-group]  
#   listener_arn = "${aws_alb_listener.webapp-lb-listener.arn}"  
#   priority     = 100   
#   action {    
#     type             = "forward"    
#     target_group_arn = "${aws_alb_target_group.webapp-target-group.id}"  
#   }   
#   # condition {    
#   #   field  = "path-pattern"    
#   #   values = ["${var.alb_path}"]  
#   # }
# }

#Autoscaling Attachment
resource "aws_autoscaling_attachment" "webapp-asg-external2" {
  alb_target_group_arn   = aws_alb_target_group.webapp-target-group.arn
  autoscaling_group_name = var.webapp-asg
}
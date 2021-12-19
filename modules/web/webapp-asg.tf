resource "aws_launch_template" "webapp-launch-template" {
  name_prefix            = "webapp-launch-template"
  image_id               = var.ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${var.allow_ssh_sg}", "${var.allow_http_sg}"]

  user_data = filebase64("${path.module}/userdata.sh")

  tags = {
    Name        = "webserver"
    Environment = "webapp"
  }
}

resource "aws_autoscaling_group" "webapp-asg" {
  desired_capacity    = 2
  max_size            = 2
  min_size            = 2
  vpc_zone_identifier = [var.public_subnet_1_id, var.public_subnet_2_id]

  launch_template {
    id      = aws_launch_template.webapp-launch-template.id
    version = "$Latest"
  }
}
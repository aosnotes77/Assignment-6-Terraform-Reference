# create a launch template
resource "aws_launch_template" "app_server_launch_template" {
  name                   = 
  image_id               = 
  instance_type          = 
  description            = 
  vpc_security_group_ids = 

  iam_instance_profile {
    name = 
  }

  monitoring {
    enabled = true
  }

  user_data = base64encode(templatefile("${path.module}/<enter the name of your script here>.tpl", {
    PROJECT_NAME = 
    ENVIRONMENT  = 
    RECORD_NAME  = 
    DOMAIN_NAME  = 
    RDS_ENDPOINT = 
    RDS_DB_NAME  = 
    USERNAME     = 
    PASSWORD     = 
  }))
}

# create auto scaling group
resource "aws_autoscaling_group" "auto_scaling_group" {
  vpc_zone_identifier = 
  desired_capacity    = 
  max_size            = 
  min_size            = 
  name                = 
  health_check_type   = 

  launch_template {
    id      = 
    version = "$Latest"
  }

  tag {
    key                 = 
    value               = 
    propagate_at_launch = 
  }

  lifecycle {
    ignore_changes        = [target_group_arns]
    create_before_destroy = true
  }

  depends_on = [aws_instance.data_migrate_ec2]
}

# attach auto scaling group to alb target group
resource "aws_autoscaling_attachment" "asg_alb_target_group_attachment" {
  autoscaling_group_name = 
  lb_target_group_arn    = 
}

# create an auto scaling group notification
resource "aws_autoscaling_notification" "webserver_asg_notifications" {
  group_names = 

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = 
}

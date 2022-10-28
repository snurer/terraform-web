resource "aws_cloudwatch_metric_alarm" "cpu_scale_out_alarm" {
  alarm_name          = replace(local.name, "rtype", "scale_out_alarm")
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.main.name
  }

  alarm_description = "monitoring CPU utilization and triggers alarm for the ASG to scale out"
  alarm_actions     = [aws_autoscaling_policy.scale_out.arn]
}

resource "aws_cloudwatch_metric_alarm" "cpu_scale_in_alarm" {
  alarm_name          = replace(local.name, "rtype", "scale_in_alarm")
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "40"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.main.name
  }
  actions_enabled   = true
  alarm_description = "monitoring CPU utilization and triggers alarm for the ASG to scale in"
  alarm_actions     = [aws_autoscaling_policy.scale_in.arn]
}
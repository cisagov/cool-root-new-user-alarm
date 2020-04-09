# Create the alarm
resource "aws_cloudwatch_metric_alarm" "new_user" {
  provider = aws.usersprovisionaccount

  alarm_actions = [
    # This is an SNS topic from ControlTower that alerts the admins
    # via email
    "arn:aws:sns:${var.aws_region}:${local.users_account_id}:aws-controltower-SecurityNotifications",
  ]
  alarm_description   = "A new user was created in the COOL Users account.  Verify that this is not unexpected."
  alarm_name          = "UserAccountCreated"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "UsersCreated"
  namespace           = "LogMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
}

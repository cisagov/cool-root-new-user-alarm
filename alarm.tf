# Create the alarm
data "aws_sns_topic" "security" {
  provider = aws.usersprovisionaccount
  depends_on = [
    aws_iam_policy.provisionalarm,
    aws_iam_role_policy_attachment.provisionalarm,
  ]

  name = "aws-controltower-SecurityNotifications"
}

resource "aws_cloudwatch_metric_alarm" "new_user" {
  provider = aws.usersprovisionaccount

  alarm_actions = [
    data.aws_sns_topic.security.arn,
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

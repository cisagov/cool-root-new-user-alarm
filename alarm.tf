# Create a metric filter that feeds the alarm
resource "aws_cloudwatch_log_metric_filter" "new_user" {
  provider = aws.rootprovisionaccount
  depends_on = [
    aws_iam_policy.provisionalarm,
    aws_iam_role_policy_attachment.provisionalarm,
  ]

  log_group_name = "aws-controltower/CloudTrailLogs"
  metric_transformation {
    name      = "UsersCreated"
    namespace = "LogMetrics"
    value     = "1"
  }
  name    = "Event - UserAccountCreated"
  pattern = "{($.eventName = \"CreateUser\")}"
}

# Create the alarm
resource "aws_cloudwatch_metric_alarm" "new_user" {
  provider = aws.rootprovisionaccount

  alarm_actions = [
    module.sns_new_user_alarms.sns_topic.arn,
  ]
  alarm_description   = "A new user was created in one of the COOL accounts.  Verify that this is not unexpected."
  alarm_name          = "UserAccountCreated"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.new_user.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.new_user.metric_transformation[0].namespace
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
}

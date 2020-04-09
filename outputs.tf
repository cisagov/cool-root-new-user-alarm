output "alarm" {
  value       = aws_cloudwatch_metric_alarm.new_user
  description = "The CloudWatch alarm that is triggered when a new user is created."
}

output "metric_filter" {
  value       = aws_cloudwatch_log_metric_filter.new_user
  description = "The metric filter that feeds the CloudWatch alarm."
}

output "policy" {
  value       = aws_iam_policy.provisionalarm
  description = "The policy created to allow creation of the CloudWatch alarm."
}

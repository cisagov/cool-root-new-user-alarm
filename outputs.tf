output "alarm" {
  value       = aws_cloudwatch_metric_alarm.new_user
  description = "The CloudWatch alarm that is triggered when a new user is created."
}

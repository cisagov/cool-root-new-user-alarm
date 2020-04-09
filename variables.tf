# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  type        = string
  description = "The AWS region where the non-global resources are to be provisioned (e.g. \"us-east-1\")."
  default     = "us-east-1"
}

variable "provisionaccount_role_name" {
  type        = string
  description = "The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Users account."
  default     = "ProvisionAccount"
}

variable "provisionalarm_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows provisioning of the CloudWatch alarm triggered when a new user is added."
  default     = "Allows provisioning of the CloudWatch alarm triggered when a new user is added."
}

variable "provisionalarm_policy_name" {
  type        = string
  description = "The name to assign the IAM policy that allows provisioning of the CloudWatch alarm triggered when a new user is added."
  default     = "ProvisionAlarm"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default     = {}
}

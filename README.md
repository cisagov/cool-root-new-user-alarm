# cool-root-new-user-alarm #

[![GitHub Build Status](https://github.com/cisagov/cool-users-new-user-alarm/workflows/build/badge.svg)](https://github.com/cisagov/cool-root-new-user-alarm/actions)

This is a Terraform deployment for creating a CloudWatch alarm that is
triggered when a new user is created.

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |
| aws.organizationsreadonly | ~> 3.38 |
| aws.rootprovisionaccount | ~> 3.38 |
| terraform | n/a |

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| sns\_new\_user\_alarms | github.com/cisagov/cw-alarm-sns-tf-module | n/a |

## Resources ##

| Name | Type |
|------|------|
| [aws_cloudwatch_log_metric_filter.new_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_metric_alarm.new_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_iam_policy.provisionalarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.provisionalarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.provisionalarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_organizations_organization.cool](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |
| [terraform_remote_state.root](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| provisionaccount\_role\_name | The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Root account. | `string` | `"ProvisionAccount"` | no |
| provisionalarm\_policy\_description | The description to associate with the IAM policy that allows provisioning of the CloudWatch alarm triggered when a new user is added. | `string` | `"Allows provisioning of the CloudWatch alarm triggered when a new user is added."` | no |
| provisionalarm\_policy\_name | The name to assign the IAM policy that allows provisioning of the CloudWatch alarm triggered when a new user is added. | `string` | `"ProvisionAlarm"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| alarm | The CloudWatch alarm that is triggered when a new user is created. |
| metric\_filter | The metric filter that feeds the CloudWatch alarm. |
| policy | The policy created to allow creation of the CloudWatch alarm. |

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.

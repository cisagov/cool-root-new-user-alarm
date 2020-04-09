# cool-users-new-user-alarm #

[![GitHub Build Status](https://github.com/cisagov/cool-users-new-user-alarm/workflows/build/badge.svg)](https://github.com/cisagov/cool-users-new-user-alarm/actions)

This is a Terraform deployment for creating a CloudWatch alarm that is
triggered when a new user is created.

## Providers ##

| Name | Version |
|------|---------|
| aws | n/a |
| aws.organizationsreadonly | n/a |
| aws.usersprovisionaccount | n/a |
| terraform | n/a |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| aws_region | The AWS region where the non-global resources are to be provisioned (e.g. "us-east-1"). | `string` | `us-east-1` | no |
| provisionaccount_role_name | The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Users account. | `string` | `ProvisionAccount` | no |
| provisionalarm_policy_description | The description to associate with the IAM policy that allows provisioning of the CloudWatch alarm triggered when a new user is added. | `string` | `Allows provisioning of the CloudWatch alarm triggered when a new user is added.` | no |
| provisionalarm_policy_name | The name to assign the IAM policy that allows provisioning of the CloudWatch alarm triggered when a new user is added. | `string` | `ProvisionAlarm` | no |
| tags | Tags to apply to all AWS resources created | `map(string)` | `{}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| alarm | The CloudWatch alarm that is triggered when a new user is created. |
| metric_filter | The metric filter that feeds the CloudWatch alarm. |
| policy | The policy created to allow creation of the CloudWatch alarm. |

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
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

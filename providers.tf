# This is the "default" provider that is used assume the roles in the
# other providers.  It uses the credentials of the caller.  It is also
# used to assume the roles required to access remote state in the
# Terraform backend.
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.tags
  }
}

# The provider used to create new resources in the Users account.
provider "aws" {
  alias  = "usersprovisionaccount"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.users.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
}

# The provider used to lookup account IDs.  See locals.
provider "aws" {
  alias  = "organizationsreadonly"
  region = var.aws_region
  assume_role {
    role_arn     = data.terraform_remote_state.master.outputs.organizationsreadonly_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
}

# tf-tagging-module

Terraform module to generate consistent tags for AWS resources. This module will enable strict naming conventions and tags

## USAGE
---
```
module "tagging" {
  source           = "git::https://github.com/glofoxinc/tf-tagging-module.git?ref=master"
  name             = "app"
  stage            = "plat"
  environment      = "platform"

  tags = {
    "context" = "memberships"
  }
}
```

## Outputs:
```
id = app-plat
name = app
tags = {
  "Environment" = "platform"
  "Name" = "appp-platform"
  "Stage" = "plat"
  "context" = "memberships"
}
tags_as_list_of_maps = [
  {
    "key" = "Environment"
    "value" = "platform"
  },
  {
    "key" = "Name"
    "value" = "app-plat"
  },
  {
    "key" = "Stage"
    "value" = "plat"
  },
  {
    "key" = "context"
    "value" = "memberships"
  },
]
```

## Now reference the label when creating any resource 

### Example

```
resource "aws_instance" "test_instance" {
  instance_type = "t1.micro"
  tags          = module.tagging.tags
}
```

This adds the following tags to the `test_instance`

```
tags = {
    "Environment" = "platform"
    "Name"        = "app-platform"
    "Stage"       = "plat"
    "context"     = "memberships"
}
```
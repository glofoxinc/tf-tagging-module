locals {

  enabled = var.enabled

  defaults = {
    label_order = ["name", "stage"]
    delimiter   = "-"
    replacement = ""
    attributes  = [""]
  }

  name               = lower(replace(var.name, var.regex_replace_chars, local.defaults.replacement))
  environment        = lower(replace(var.environment, var.regex_replace_chars, local.defaults.replacement))
  stage              = lower(replace(var.stage, var.regex_replace_chars, local.defaults.replacement))
  delimiter          = coalesce(var.delimiter, local.defaults.delimiter)
  label_order        = length(var.label_order) > 0 ? var.label_order : local.defaults.label_order
  additional_tag_map = var.additional_tag_map
  attributes         = compact(distinct(concat(var.attributes, local.defaults.attributes)))

  tags_context = {
    name        = local.id
    environment = local.environment
    stage       = local.stage
    attributes  = lower(replace(join(local.delimiter, local.attributes), var.regex_replace_chars, local.defaults.replacement))
  }

  generated_tags = { for l in keys(local.tags_context) : title(l) => local.tags_context[l] if length(local.tags_context[l]) > 0 }
  
  tags = merge(local.generated_tags, var.tags)

  tags_as_list_of_maps = flatten([
    for key in keys(local.tags) : merge(
      {
        key   = key
        value = local.tags[key]
    }, var.additional_tag_map)
  ])

  id_context = {
    name        = local.name
    environment = local.environment
    stage       = local.stage
  }

  labels = [for l in local.label_order : local.id_context[l] if length(local.id_context[l]) > 0]

  id = lower(join(local.delimiter, local.labels))

  output_context = {
    enabled             = local.enabled
    name                = local.name
    environment         = local.environment
    stage               = local.stage
    attributes          = local.attributes
    tags                = local.tags
    delimiter           = local.delimiter
    label_order         = local.label_order
    regex_replace_chars = var.regex_replace_chars
    additional_tag_map  = local.additional_tag_map
  }

}
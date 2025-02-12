# Providers
provider "github" {
  token = var.github_token  # GitHub token should be managed securely
}

module "repo_rulesets" {
  source           = "./modules/ruleset"
  for_each         = var.repositories
  repo_name        = each.value.repo_name
  ruleset_name     = each.value.ruleset.ruleset_name
  include_branches = each.value.ruleset.include_branches
  exclude_branches = each.value.ruleset.exclude_branches
  required_checks  = each.value.ruleset.required_checks
  
}

module "branch_protection" {
  source                     = "./modules/branch_protection"
  for_each                   = var.repositories
  repo                       = toset([each.value.repo_name])
  repo_name                  = each.value.repo_name
  branches                   = each.value.branch_protection.protected_branches
  github_username            = var.github_username
  required_approvals         = each.value.branch_protection.required_approvals
  require_code_owner_reviews = each.value.branch_protection.require_code_owner_reviews
  require_status_checks      = each.value.branch_protection.require_status_checks
  required_status_checks_contexts = each.value.branch_protection.required_status_checks_contexts
  enforce_admins             = each.value.branch_protection.enforce_admins
}
locals {
  repo_names  = [for repo in var.repositories : repo.repo_name]
  protected_branches = flatten([for repo in var.repositories : repo.branch_protection.protected_branches])
  ruleset_name = [for repo in var.repositories : repo.ruleset.ruleset_name]
  include_branches = flatten([for repo in var.repositories : repo.ruleset.include_branches])
  exclude_branches = flatten([for repo in var.repositories : repo.ruleset.exclude_branches])
  required_checks = flatten([for repo in var.repositories : repo.ruleset.required_checks])
  required_approvals = [for repo in var.repositories : repo.branch_protection.required_approvals]
  require_code_owner_reviews = [for repo in var.repositories : repo.branch_protection.require_code_owner_reviews]
  require_status_checks = [for repo in var.repositories : repo.branch_protection.require_status_checks]
  required_status_checks_contexts = flatten([for repo in var.repositories : repo.branch_protection.required_status_checks_contexts])
  enforce_admins = [for repo in var.repositories : repo.branch_protection.enforce_admins]
}


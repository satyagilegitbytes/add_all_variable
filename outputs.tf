output "ruleset_ids" {
  description = "The IDs of the created rulesets"
  value = { for repo, module in module.repo_rulesets : repo => module.ruleset_id }
}
#
#output "branch_protection_ids" {
#  value = module.branch_protection.branch_protection_ids
#}

#output "branch_protection_ids" {
#  description = "List of branch protection IDs"
#  value       = [for protection in github_branch_protection.this : protection.id]
#}


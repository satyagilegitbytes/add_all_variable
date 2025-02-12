output "branch_protection_ids" {
  description = "List of branch protection IDs"
  value       = [for protection in github_branch_protection.this : protection.id]
}

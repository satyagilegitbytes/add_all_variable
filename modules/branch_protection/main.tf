data "github_repository" "this" {
  for_each  = var.repo
  full_name = "${var.github_username}/${each.value}"
}


resource "github_branch_protection" "this" {
  for_each = toset(var.branches)

  repository_id = data.github_repository.this[var.repo_name].id
  pattern       = each.key

  required_pull_request_reviews {
    required_approving_review_count = var.required_approvals
    require_code_owner_reviews     = var.require_code_owner_reviews
  }

  required_status_checks {
    strict   = var.require_status_checks
    contexts = var.required_status_checks_contexts
  }

  enforce_admins = var.enforce_admins
}

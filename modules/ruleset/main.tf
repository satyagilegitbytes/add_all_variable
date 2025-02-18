resource "github_repository_ruleset" "rules" {
  provider    = github
  name        = var.ruleset_name
  repository  = var.repo_name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = var.include_branches
      exclude = var.exclude_branches
    }
  }

  rules {
    required_status_checks {
      dynamic "required_check" {
        for_each = var.required_checks
        content {
          context = required_check.value
        }
      }
    }
  #  restrictions {
  #  users = ["${var.github_owner}"] # Only allow the repository owner to bypass restrictions
  #  teams = []
  #}
  

    creation                = var.creation
    update                  = var.update
    deletion                = var.deletion
    required_linear_history = var.required_linear
    required_signatures     = var.required_sign
    non_fast_forward        = var.non_fast_forward
    #required_code_scanning  = true
     pull_request {
      # Required code scanning alerts (if needed)
      #required_code_scanning_alerts = true
      # required_code_scanning_alerts_threshold = "high"
    }
  }
}

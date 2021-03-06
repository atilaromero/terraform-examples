# To use in free tier
# This module monitors the account costs.
# When it is greater than $0.01 per day, it sends an e-mail alert
variable "subscriber_email_addresses" {
  type = list(string)
}

resource "aws_budgets_budget" "zero_cost" {
  name = "Zero cost"
  budget_type = "COST"
  limit_amount      = "0.01"
  limit_unit        = "USD"
  time_period_start = "2021-02-03_00:00"
  time_unit         = "DAILY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = var.subscriber_email_addresses
  }
}
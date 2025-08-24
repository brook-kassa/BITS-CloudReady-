resource "aws_iam_policy" "require_mfa" {
  name        = "RequireMFA"
  description = "Deny all actions except a few if MFA is not present"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyAllExceptforMFA",
        Effect = "Deny",
        NotAction = [
          "iam:CreateVirtualMFADevice",
          "iam:EnableMFADevice",
          "iam:GetUser",
          "iam:ListMFADevices",
          "iam:ListVirtualMFADevices",
          "iam:ResyncMFADevice"
        ],
        Resource = "*",
        Condition = {
          BoolIfExists = {
            "aws:MultiFactorAuthPresent" = "false"
          }
        }
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "mfa_enforce_bkassa9" {
  user       = "bkassa9"
  policy_arn = aws_iam_policy.require_mfa.arn
}
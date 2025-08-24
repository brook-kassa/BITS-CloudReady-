resource "aws_iam_role_policy" "vpc_flow_logs_to_cw" {
  name = "bits-${var.environment}-vpc-flow-logs-to-cw"
  role = aws_iam_role.vpc_flow_logs.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = [
          "${aws_cloudwatch_log_group.cloudwatch.arn}",
          "${aws_cloudwatch_log_group.cloudwatch.arn}:*"
        ]
      }
    ]
  })
}

resource "aws_flow_log" "vpc" {
  vpc_id       = aws_vpc.main.id
  traffic_type = "ALL"

  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.cloudwatch.arn
  iam_role_arn         = aws_iam_role.vpc_flow_logs.arn

  max_aggregation_interval = 60

  tags = {
    Name = "bits-${var.environment}-vpc-flowlogs"
  }
}

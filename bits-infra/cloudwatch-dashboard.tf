resource "aws_cloudwatch_dashboard" "bits_dashboard" {
  dashboard_name = "bits-dashboard-${var.environment}"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric",
        x      = 0,
        y      = 0,
        width  = 12,
        height = 6,
        properties = {
          title = "RDS CPU Utilization",
          metrics = [
            ["AWS/RDS", "CPUUtilization", "DBInstanceIdentifier", aws_db_instance.bits_db.id]
          ],
          period = 300,
          stat   = "Average",
          region = var.aws_region
        }
      },
      {
        type   = "metric",
        x      = 0,
        y      = 6,
        width  = 12,
        height = 6,
        properties = {
          title = "RDS Read Latency",
          metrics = [
            ["AWS/RDS", "ReadLatency", "DBInstanceIdentifier", aws_db_instance.bits_db.id]
          ],
          period = 300,
          stat   = "Average",
          region = var.aws_region
        }
      },
      {
        type   = "metric",
        x      = 0,
        y      = 12,
        width  = 12,
        height = 6,
        properties = {
          title = "RDS Connections",
          metrics = [
            ["AWS/RDS", "DatabaseConnections", "DBInstanceIdentifier", aws_db_instance.bits_db.id]
          ],
          period = 300,
          stat   = "Average",
          region = var.aws_region
        }
      }
    ]
  })
}

resource "aws_cloudwatch_metric_alarm" "rds_high_cpu" {
  alarm_name          = "rds-high-cpu-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Alarm when RDS CPU exceeds 70%"
  dimensions = {
    DBInstanceIdentifier = aws_db_instance.bits_db.id
  }
  alarm_actions = [] # Add SNS topic ARN here if needed
}

resource "aws_cloudwatch_metric_alarm" "rds_high_latency" {
  alarm_name          = "rds-high-latency-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "ReadLatency"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 0.1
  alarm_description   = "Alarm when RDS read latency exceeds 0.1 seconds"
  dimensions = {
    DBInstanceIdentifier = aws_db_instance.bits_db.id
  }
  alarm_actions = []
}

resource "aws_cloudwatch_metric_alarm" "rds_connection_spike" {
  alarm_name          = "rds-connection-spike-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "Alarm when DB connections spike over 50"
  dimensions = {
    DBInstanceIdentifier = aws_db_instance.bits_db.id
  }
  alarm_actions = []
}

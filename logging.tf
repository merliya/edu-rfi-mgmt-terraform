resource "aws_s3_bucket" "logs" {
  bucket = "${var.name_prefix}-${var.environment}-logs"
  acl    = "log-delivery-write"

  force_destroy = var.environment == "mgmt"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }

  lifecycle_rule {
    id      = "all"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }

  tags = local.logging_tags
}
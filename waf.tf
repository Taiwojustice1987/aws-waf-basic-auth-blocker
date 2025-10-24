########################################################
# Global WAF for CloudFront
########################################################
resource "aws_wafv2_web_acl" "global_acl" {
  provider    = aws.global
  name        = "cloudfront-global-waf"
  description = "Global WAF for CloudFront - block Authorization: Basic"
  scope       = "CLOUDFRONT"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "cloudfrontGlobalWAF"
    sampled_requests_enabled   = true
  }

  rule {
    name     = "BlockBasicAuth"
    priority = 1
    action {
      block {}
    }

    statement {
      byte_match_statement {
        search_string = "Basic"

        field_to_match {
          single_header {
            name = "authorization"  # must be lowercase
          }
        }

        positional_constraint = "CONTAINS"

        text_transformation {
          priority = 0
          type     = "NONE"
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "BlockBasicAuth"
      sampled_requests_enabled   = true
    }
  }
}

########################################################
# Regional WAF for ALB
########################################################
resource "aws_wafv2_web_acl" "regional_acl" {
  name        = "regional-alb-waf"
  description = "Regional WAF for ALB - block Authorization: Basic"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "regionalALBWAF"
    sampled_requests_enabled   = true
  }

  rule {
    name     = "BlockBasicAuth"
    priority = 1
    action {
      block {}
    }

    statement {
      byte_match_statement {
        search_string = "Basic"

        field_to_match {
          single_header {
            name = "authorization"
          }
        }

        positional_constraint = "CONTAINS"

        text_transformation {
          priority = 0
          type     = "NONE"
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "BlockBasicAuth"
      sampled_requests_enabled   = true
    }
  }
}

########################################################
# WAF Associations
########################################################

# Associate Global WAF with CloudFront
resource "aws_wafv2_web_acl_association" "cloudfront_waf_assoc" {
  provider     = aws.global
  resource_arn = "arn:aws:cloudfront::626635400294:distribution/ET9LQ2LHDEEPL"  # Full ARN
  web_acl_arn  = aws_wafv2_web_acl.global_acl.arn
  depends_on   = [aws_wafv2_web_acl.global_acl]
}

# Associate Regional WAF with ALB
resource "aws_wafv2_web_acl_association" "alb_waf_assoc" {
  resource_arn = "arn:aws:elasticloadbalancing:us-east-1:626635400294:loadbalancer/app/TestWAFALB/03c4df48e873e5d7"
  web_acl_arn  = aws_wafv2_web_acl.regional_acl.arn
  depends_on   = [aws_wafv2_web_acl.regional_acl]
}

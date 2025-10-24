########################################################
# WAF Association Outputs
########################################################

output "cloudfront_waf_association_id" {
  value = aws_wafv2_web_acl_association.cloudfront_waf_assoc.id
}

output "alb_waf_association_id" {
  value = aws_wafv2_web_acl_association.alb_waf_assoc.id
}

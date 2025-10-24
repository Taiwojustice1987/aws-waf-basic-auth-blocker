# aws-waf-basic-auth-blocker
Terraform project to create AWS WAF rules that protect both global and regional resources. The Web ACL blocks incoming HTTP requests containing the Authorization header with the string Basic. The WAF is applied to a CloudFront distribution (global) and an Application Load Balancer (regional).

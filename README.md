<<<<<<< HEAD
# aws-waf-basic-auth-blocker
Terraform project to create AWS WAF rules that protect both global and regional resources. The Web ACL blocks incoming HTTP requests containing the Authorization header with the string Basic. The WAF is applied to a CloudFront distribution (global) and an Application Load Balancer (regional).
=======
AWS WAF Basic Auth Blocker
Project Overview

This Terraform project implements AWS Web Application Firewall (WAF) rules to protect both global and regional resources. The main objective is to block incoming HTTP requests containing the Authorization header with the string Basic.

The WAF is applied to:

Global resource: CloudFront distribution

Regional resource: Application Load Balancer (ALB)

This ensures that sensitive services are protected from unauthorized Basic Authentication attempts at both global and regional scopes.

Architecture
                ┌───────────────────────────────┐
                │       CloudFront (Global)      │
                │  Protected by WAF Global ACL   │
                └─────────────┬─────────────────┘
                              │
                              │
                    ┌─────────▼─────────┐
                    │   ALB (Regional)   │
                    │ Protected by WAF   │
                    │    Regional ACL    │
                    └───────────────────┘

Global ACL is applied via aws_wafv2_web_acl with scope: CLOUDFRONT

Regional ACL is applied via aws_wafv2_web_acl with scope: REGIONAL

Features

Blocks requests with HTTP header Authorization containing "Basic".

CloudWatch metrics enabled for both global and regional WAFs.

Fully automated using Terraform for infrastructure as code.

Supports multiple environments via provider configuration (global and regional)
>>>>>>> db5a821 (Initial commit: AWS WAF project for CloudFront and ALB)

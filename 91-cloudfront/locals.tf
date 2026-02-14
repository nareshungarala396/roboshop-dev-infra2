locals {
    cachingDisabled = data.aws_cloudfront_cache_policy.cachingDisabled.id
    cachingOptimised = data.aws_cloudfront_cache_policy.cachingOptimised.id
    cdn_certificate_arn = data.aws_ssm_parameter.certificate_arn.value
    common_tags = {
      Project = var.project_name
      Enviroment = var.environment
      Terraform = "true"
    }
}
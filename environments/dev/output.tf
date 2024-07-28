output "invoke_url" {
  value = "${module.api_gateway.execution_arn}/hello"
}
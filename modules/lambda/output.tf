output "lambda_uri" {
  value = aws_lambda_function.express_lambda.invoke_arn
}

output "function_name" {
  value = aws_lambda_function.express_lambda.function_name
}
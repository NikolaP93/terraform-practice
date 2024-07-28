resource "aws_lambda_function" "express_lambda" {
  function_name = var.function_name
  handler       = "app.handler"
  runtime       = "nodejs20.x"
  role          = var.role_arn
  filename      = "../../lambda.zip"

  source_code_hash = filebase64sha256("../../lambda.zip")
}


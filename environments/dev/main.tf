provider "aws" {
  region = "eu-north-1"
}

module "iam" {
  source = "../../modules/iam"
  role_name = "lambda_exec_role"
}

module "lambda" {
  source = "../../modules/lambda"
  function_name = "express-lambda-app"
  role_arn = module.iam.arn  // Updated line
}

module "api_gateway" {
  source = "../../modules/api_gateway"
  api_name = "express-lambda-api"
  api_description = "API for Express Lambda"
  lambda_uri = module.lambda.lambda_uri
}

resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = module.api_gateway.execution_arn
}

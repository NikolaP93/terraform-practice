resource "aws_apigatewayv2_api" "api" {
  name        = var.api_name
  description = var.api_description
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "lambda" {
  api_id = aws_apigatewayv2_api.api.id
  integration_type = "AWS_PROXY"
  integration_uri = var.lambda_uri
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "hello" {
  api_id = aws_apigatewayv2_api.api.id
  route_key = "GET /hello"
  target = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

resource "aws_apigatewayv2_stage" "stage" {
  api_id = aws_apigatewayv2_api.api.id
  auto_deploy = true
  name = "$default"
}
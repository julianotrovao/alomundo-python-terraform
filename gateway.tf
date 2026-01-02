resource "aws_apigatewayv2_api" "http_api" {
  name          = "alo-mundo-gateway"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "ecs_integration" {
  api_id           = aws_apigatewayv2_api.http_api.id
  integration_type = "HTTP_PROXY"
  integration_uri  = "http://private-ip-do-seu-alb:5000" # Ou via Cloud Map
  connection_type  = "VPC_LINK"
  connection_id    = aws_apigatewayv2_vpc_link.main.id
}

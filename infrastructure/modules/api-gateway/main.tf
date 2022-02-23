resource "aws_api_gateway_rest_api" "burl_api" {
  name = "burl_api"
}

resource "aws_api_gateway_resource" "event_resource" {
  parent_id   = aws_api_gateway_rest_api.burl_api.root_resource_id
  path_part   = "event"
  rest_api_id = aws_api_gateway_rest_api.burl_api.id
}

resource "aws_api_gateway_method" "post_method" {
  authorization = "NONE"
  http_method   = "POST"
  resource_id   = aws_api_gateway_resource.event_resource.id
  rest_api_id   = aws_api_gateway_rest_api.burl_api.id
}
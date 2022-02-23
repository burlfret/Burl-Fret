resource "aws_api_gateway_rest_api" "burl_api" {
  name = "burl_api"
}

resource "aws_api_gateway_resource" "event-resource" {
  parent_id   = aws_api_gateway_rest_api.burl_api.root_resource_id
  path_part   = "event"
  rest_api_id = aws_api_gateway_rest_api.burl_api.id
}
resource "aws_iam_role" "burlfret_role" {
  name = "burlfret_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_lambda_function" "burlfret" {
  filename      = "${path.module}/burlfret.py.zip"
  function_name = "burlfret"
  role          = aws_iam_role.burlfret_role.arn
  handler       = "burlfret.lambda_handler"

  source_code_hash = filebase64sha256("${path.module}/burlfret.py.zip")

  runtime = "python3.8"

}

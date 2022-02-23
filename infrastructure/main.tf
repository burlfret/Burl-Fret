terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "archive_file" "init" {
  type             = "zip"
  source_dir       = "${path.module}/../burlfret"
  output_file_mode = "0666"
  output_path      = "${path.module}/modules/lambda/burlfret.py.zip"
}

module "api_gateway" {
  source = "./modules/api-gateway"

}


module "lambda" {
  source = "./modules/lambda"

  depends_on = [
    data.archive_file.init
  ]
}

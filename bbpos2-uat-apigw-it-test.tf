terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_api_gateway_rest_api" "IT-Test-RestApi" {
    name = "IT-Test01"
    api_key_source = "HEADER"
    endpoint_configuration {
        types = [
            "PRIVATE"
        ]
    }
}

resource "aws_api_gateway_stage" "Production-Stage" {
    stage_name = "Production"
    deployment_id = "667lzn"
    rest_api_id = "hrkxu40h2l"
    description = "Production"
    cache_cluster_enabled = false
    cache_cluster_size = "0.5"
    xray_tracing_enabled = false
}

resource "aws_api_gateway_deployment" "mTLS-deploy" {
    rest_api_id = "hrkxu40h2l"
    description = "Disable default endpoint for mTLS"
}

resource "aws_api_gateway_deployment" "deploy02" {
    rest_api_id = "hrkxu40h2l"
}

resource "aws_api_gateway_deployment" "deploy03" {
    rest_api_id = "hrkxu40h2l"
    description = "Production"
}

resource "aws_api_gateway_deployment" "deploy04" {
    rest_api_id = "hrkxu40h2l"
}

resource "aws_api_gateway_resource" "status-Resource" {
    rest_api_id = "hrkxu40h2l"
    path_part = "status"
    parent_id = "go29zc13lk"
}

resource "aws_api_gateway_method" "status-get-method" {
    rest_api_id = "hrkxu40h2l"
    resource_id = "0smkzj"
    http_method = "GET"
    authorization = "NONE"
    api_key_required = false
}

resource "aws_api_gateway_method" "get-method" {
    rest_api_id = "hrkxu40h2l"
    resource_id = "go29zc13lk"
    http_method = "GET"
    authorization = "NONE"
    api_key_required = false
}
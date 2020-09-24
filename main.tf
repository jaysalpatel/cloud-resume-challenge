terraform {
  required_providers {
    aws = {
      source =  "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

##VPC creation
resource "aws_vpc" "cloud-resume-challenge-vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_s3_bucket" "cloud-resume-challenge-jaysalpatel" {
    default = "cloud-resume-challenge-jaysal"
    acl = "public"
    
    tags = {
        Name = "Cloud resume challenge resume "
    }
}

resource "aws_dynamodb_table" "visitorcounter" {
    name = "visitorcounter"
    billing_mode = "PAY_PER_REQUEST"
    read_capacity = 5
    write_capacity = 5
    hash_key = "visitorcounter"
    
    attribute {
    name = "visitorcount"
    type = "S"
}

   

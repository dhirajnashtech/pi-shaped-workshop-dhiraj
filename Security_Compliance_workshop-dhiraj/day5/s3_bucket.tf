terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.15.0"
    }
  }
}

provider "aws" {

}


resource "aws_s3_bucket" "demo" {
  bucket = "my-tf-demo-bucket"
  acl    = "public-read"
}

#resource "aws_s3_bucket_ownership_controls" "demo" {
#  bucket = aws_s3_bucket.demo.id
#  rule {
#    object_ownership = "BucketOwnerPreferred"
#  }
#}

#resource "aws_s3_bucket_public_access_block" "demo" {
#  bucket = aws_s3_bucket.demo.id
#
#  block_public_acls       = false
#  block_public_policy     = false
#  ignore_public_acls      = false
#  restrict_public_buckets = false
#}
#
#resource "aws_s3_bucket_acl" "demo" {
#  depends_on = [
#    aws_s3_bucket_ownership_controls.demo,
#    aws_s3_bucket_public_access_block.demo,
#  ]
#
#  bucket = aws_s3_bucket.demo.id
#  acl    = "public-read"
#}
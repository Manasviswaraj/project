provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "mys3bucket" {
  bucket = "manasvi-s3-bucket-smart"
  
  

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "s3_acl" {
  bucket = aws_s3_bucket.mys3bucket.id
  acl= "public-read-write"
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket= aws_s3_bucket.mys3bucket.id
  versioning_configuration{
    status = "Enabled"
  }
}
resource "aws_s3_bucket" "staticwebsite" {
  bucket = var.bucketname

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "bucketowner" {
  bucket = aws_s3_bucket.staticwebsite.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "bucketpublicaccess" {
  bucket = aws_s3_bucket.staticwebsite.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "staticwebsiteacl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucketowner,
    aws_s3_bucket_public_access_block.bucketpublicaccess,
  ]

  bucket = aws_s3_bucket.staticwebsite.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.staticwebsite.id
  key    = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.staticwebsite.id
  key    = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "websiteconfig" {
  bucket = aws_s3_bucket.staticwebsite.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  depends_on = [ aws_s3_bucket_acl.staticwebsiteacl ]
}
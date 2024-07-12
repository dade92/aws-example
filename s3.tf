resource "aws_s3_bucket" "s3-bucket" {
  bucket = "s3-bucket-example-1234599"
  force_destroy = true
}
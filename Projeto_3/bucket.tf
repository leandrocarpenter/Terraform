resource "aws_s3_bucket" "first_bucket" {
  bucket = "carpenter-s3-carpenter-remotestate"

  versioning {
    enabled = true
  }
}
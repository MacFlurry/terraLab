provider "aws" {
   region = "eu-west-1"
}

# Create an S3 bucket by using aws_s3_bucket

resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-bucket-omega"

    versioning {
        enable = true
    }

    lifecycle {
        prevent_destroy = true
    }
}
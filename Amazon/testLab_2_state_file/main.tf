provider "aws" {
   region = "eu-west-1"
}

terraform{
    backend "s3" {
        bucket = "terraform-bucket-omega"
        key = "global/s3/terraform.tfstate"
        region = "eu-west-1"
        encrypt = true
    }
}


# Create an S3 bucket by using aws_s3_bucket

resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-bucket-omega"

    versioning {
        enabled = true
    }

    lifecycle {
        prevent_destroy = true
    }
}

output "s3_bucket_arn" {
    value = "${aws_s3_bucket.terraform_state.arn}"
}
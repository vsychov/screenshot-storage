data "aws_canonical_user_id" "current_user" {}

resource "aws_s3_bucket" "this" {
  bucket        = var.aws-bucket-id
  force_destroy = false
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  index_document {
    suffix = aws_s3_object.index_html.key
  }

  error_document {
    key = aws_s3_object.index_html.key
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.bucket

  access_control_policy {
    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/global/AllUsers"
      }
      permission = "READ_ACP"
    }

    grant {
      grantee {
        id   = data.aws_canonical_user_id.current_user.id
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }

    owner {
      id = data.aws_canonical_user_id.current_user.id
    }
  }
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "index.html"
  source       = "${path.module}/assets/index.html"
  etag         = filemd5("${path.module}/assets/index.html")
  acl          = "public-read"
  content_type = "text/html"
}
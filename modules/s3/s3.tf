# Create S3 bucket
# resource "aws_s3_bucket" "react_ui_s3_bucket" {
#   bucket = var.s3_ui_bucket_name
#   acl    = "public-read"

#   tags = {
#     Name        = "Todo app UI code bucket"
#     Environment = terraform.workspace
#   }
# }

# Upload react UI files to S3 bucket
# resource "aws_s3_bucket_object" "todoapp_ui_files" {
#   for_each      = fileset(abspath(var.todoapp_ui_path), "**/*.*")
#   bucket        = aws_s3_bucket.react_ui_s3_bucket.bucket
#   key           = replace(each.value, var.todoapp_ui_path, "")
#   source        = "${var.todoapp_ui_path}${each.value}"
#   acl           = "public-read"
#   etag          = filemd5("${var.todoapp_ui_path}${each.value}")
# }

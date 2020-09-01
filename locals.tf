# Contains expressions which are repeated in several places

locals {
    vpc_name = "${terraform.workspace == "dev" ? "vpc-dev" : "vpc-prod" }"
}
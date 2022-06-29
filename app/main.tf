# infrastructure-modules/app/main.tf
provider "aws" {
  region = "us-east-1"
  # ... other provider settings ...
}
terraform {
  backend "s3" {}
}
module "app" {
  source = "../../../app"
  instance_type  = var.instance_type
  instance_count = var.instance_count
  # ... other app settings ...
}
# infrastructure-modules/app/outputs.tf
output "url" {
  value = module.app.url
}
# infrastructure-modules/app/variables.tf

variable "instance_type" {}
variable "instance_count" {}
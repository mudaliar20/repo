provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA3BUSMKWNMS7LXN77"
  secret_key = "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"
}

terraform{
  backend "s3" {
	bucket = "kaiburr-test1"
	key    = "statefile/terraform.tfstate"
	region = "us-east-2"
	role_arn = "arn:aws:iam::759442462106:role/terraform-test-role"
     }
}

module "s3" {
 source = "./S3"
}

module "lambda" {
 source = "./Lambda"
}

provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
	  }
	}


terraform{
  backend "s3" {
	bucket = "kaiburr-test1"
	key    = "statefile/terraform.tfstate"
	region = "us-east-2"
     }
}

module "s3" {
 source = "./S3"
}

module "lambda" {
 source = "./Lambda"
}

terraform {
  backend "s3" {
    bucket = "kunal-supekar-tf-bucket-001"
    key    = "kunalsupekar/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-dynamodb"
  }
}

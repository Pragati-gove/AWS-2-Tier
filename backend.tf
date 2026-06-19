terraform {
  backend "s3" {
    bucket       = "pragati-terraform-state-bucket"
    key          = "2tier/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}




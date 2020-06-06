terraform {
    backend "s3" {
        bucket = "ao-test-remote-state"
        key = "ao-test-compute.tfstate"
        region = "eu-west-2"
        encrypt = true
    }
}
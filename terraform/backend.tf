terraform {
    backend "s3" {
        bucket = "ao-test-remote-state"
        key = "ao-test-app.tfstate"
        region = "eu-west-2"
        encrypt = true
    }
}
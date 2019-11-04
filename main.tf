terraform {
    backend "s3" {
        bucket = "pgr301bucket"
        key    = "lagasild/terraform.tfstate"
        region = "eu-north-1"
    }
}

module "heroku_module" {
    source = "./heroku_module"
    name = "devops-exam"
    buildpacks = [
        "heroku/java"
    ]
    logz_token = "${var.logz_token}"
    logz_url = "${var.logz_url}"
}
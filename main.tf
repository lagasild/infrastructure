terraform {
    backend "s3" {
        bucket = "pgr301bucket"
        key    = "lagasild/terraform.tfstate"
        region = "eu-north-1"
    }
}

module heroku_apps {
    source = "./module"
    name = "exam" 
    buildpacks = [    
        "heroku/java"
    ]
}
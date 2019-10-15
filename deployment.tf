provider "heroku" {}

module "heroku_module" {
    source = "./heroku_module"
    name = "devops-exam" 
    buildpacks = [    
        "heroku/java"
    ]
    providers = {
        heroku = heroku
    }
}
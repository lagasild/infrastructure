module "heroku" {
    source = "./heroku_module"
    name = "devops-exam" 
    buildpacks = [    
        "heroku/java"
    ]
}
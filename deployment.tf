module heroku_apps {
    source = "./heroku_module"
    name = "devops-exam" 
    buildpacks = [    
        "heroku/java"
    ]
}
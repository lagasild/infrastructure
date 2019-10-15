module heroku_apps {
    source = "./module"
    name = "exam" 
    buildpacks = [    
        "heroku/java"
    ]
}
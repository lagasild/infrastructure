# Infrastructure
Infrastructure code for exam at at Kristiania University College

## Description 
Terraform module for deploying apps to Heroku, with 
a deployment pipeline. 

Deploys apps for _test_, _staging_, and _production_. 
Deploys pipeline from _staging_ to _production_. 

## Usage 
```hcl-terraform
module SOME_IDENTIFIER {
  source = github.com/olaven/heroku-terraform-module
  name = test-app # YOUR APP NAME
  buildpacks = [    # YOUR BUILDPACKS 
    heroku/java
  ]
}
```

# Infrastructure
Infrastructure code for exam at at Kristiania University College

## Setup 
TODO: ALL relevant travis keys for this build
`travis encrypt TF_VAR_logz_url=<your_url> --add`
`travis encrypt TF_VAR_logz_token=<your_key> --add`

## Description 
[main.tf](./main.tf) is based on a local Terraform [module](./module). 

Deploys apps for _test_, _staging_, and _production_.
Deploys a pipline with all apps. 

## Notes 
### Opsgenie
* Emails: 
    * lagasild_opsgenie_owner@protonmail.com
    * lagasild_opsgenie_first_user@protonmail.com
    * lagasild_opsgenie_second_user@protonmail.com
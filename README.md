# Infrastructure [![Build Status](https://travis-ci.org/lagasild/infrastructure.svg?branch=master)](https://travis-ci.org/lagasild/infrastructure)
Infrastructure code for exam at at Kristiania University College. 
The application may be found [here](https://github.com/lagasild/geiger). 

## Setup
* `travis encrypt AWS_ACCESS_KEY_ID=<your_key_id> --add` 
* `travis encrypt AWS_SECRET_ACCESS_KEY=<your_key> --add`
* `travis encrypt HEROKU_API_KEY=<your_key> --add`
* `travis encrypt STATUSCAKE_USERNAME=<your_username> --add`
* `travis encrypt STATUSCAKE_APIKEY=<your_key> --add`
* `travis encrypt OPSGENIE_API_KEY=<your_key> --add`
* `travis encrypt TF_VAR_logz_url=<your_url> --add`
* `travis encrypt TF_VAR_logz_token=<your_key> --add`

## Description 
Heroku-setup is based on a local Terraform [module](./module). 

### Heroku
Deploys apps for _test_, _staging_, and _production_.
Deploys a pipeline with all apps. The apps require variables for 
Logz.io-integration. 

### Statuscake 
Pings _stage_ and _prod_ every 300 seconds. 

### Opsgenie 
Creates infrastructure teams and schedules for 
on-call rotations. 


![Terraform tree](./graph.svg)

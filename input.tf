variable name {
  description = Base name for the Heroku app
  default = ["heroku/java"]
  type = string
}

variable buildpacks {
  description = Array of heroku buildpacks
  type = list
}

variable region {
  description = The region for Heroku deploy
  default = eu
  type = string
}

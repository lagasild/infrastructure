variable name {
  description = "Base name for the Heroku app"
  type = "string"
}

variable buildpacks {
  description = "Array of heroku buildpacks"
  default = ["heroku/java"]
  type = "list"
}

variable region {
  description = "The region for Heroku deploy"
  default = "eu"
  type = "string"
}

variable logz_url {
  description = "URL for logz.io"
}

variable logz_token {
  description = "Token for logz.io"
}
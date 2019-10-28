provider "heroku" {
  version = "2.2.1"
}

# Creating apps:
resource "heroku_app" "test" {
  name = "${var.name}-test"
  region = "${var.region}"
  buildpacks = "${var.buildpacks}"

  sensitive_config_vars = {
    LOGZ_TOKEN = "${var.logz_token}"
    LOGZ_URL = "${var.logz_url}"
  }
}

resource "heroku_app" "staging" {
  name = "${var.name}-staging"
  region = "${var.region}"
  buildpacks = "${var.buildpacks}"

  sensitive_config_vars = {
    LOGZ_TOKEN = "${var.logz_token}"
    LOGZ_URL = "${var.logz_url}"
  }
}

resource "heroku_app" "production" {
  name = "${var.name}-production"
  region = "${var.region}"
  buildpacks = "${var.buildpacks}"

  sensitive_config_vars = {
    LOGZ_TOKEN = "${var.logz_token}"
    LOGZ_URL = "${var.logz_url}"
  }
}



resource "heroku_pipeline" "pipeline" {
  name = "${var.name}-staging"
}

resource "heroku_pipeline_coupling" "pipeline_test" {
  app = "${heroku_app.test.name}"
  pipeline = "${heroku_pipeline.pipeline.id}"
  stage = "development"
}

resource "heroku_pipeline_coupling" "pipeline_staging" {
  app = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.pipeline.id}"
  stage = "staging"
}

resource "heroku_pipeline_coupling" "pipeline_production" {
  app = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.pipeline.id}"
  stage = "production"
}
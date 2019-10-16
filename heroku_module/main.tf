provider "heroku" {}

# Creating apps:
resource "heroku_app" "test" {
  name = "${var.name}-test"
  region = "${var.region}"
  buildpacks = "${var.buildpacks}"
}

resource "heroku_app" "staging" {
  name = "${var.name}-staging"
  region = "${var.region}"
  buildpacks = "${var.buildpacks}"
}

resource "heroku_app" "production" {
  name = "${var.name}-production"
  region = "${var.region}"
  buildpacks = "${var.buildpacks}"
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
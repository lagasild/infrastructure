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

# Pipelines
/*resource "heroku_pipeline" "deploy" {
  name = "${var.name}-production"
}

resource "heroku_pipeline_coupling" "staging" {
  app = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.deploy.id}"
  stage = "staging"
}

resource "heroku_pipeline_coupling" "production" {
  app = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.deploy.id}"
  stage = "production"
}*/


resource "heroku_pipeline" "test_to_staging" {
  name = "${var.name}-staging"
}

resource "heroku_pipeline_coupling" "to_staging_test" {
  app = "${heroku_app.test.name}"
  pipeline = "${heroku_pipeline.test_to_staging.id}"
  stage = "staging" #i.e. "first" stage on Heroku
}

resource "heroku_pipeline_coupling" "to_staging_staging" {
  app = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.test_to_staging.id}"
  stage = "production"
}
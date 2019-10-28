output "test_url" {
  value = "${heroku_app.test.web_url}"
}

output "staging_url" {
  value = "${heroku_app.staging.web_url}"
}

output "production_url" {
  value = "${heroku_app.production.web_url}"
}

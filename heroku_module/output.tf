output "production_url" { # Not used right now, as I am monitoring the test app instead.
  value = "${heroku_app.production.web_url}"
}

output "test_url" {
  value = "${heroku_app.test.web_url}"
}
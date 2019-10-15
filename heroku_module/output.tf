output "production_url" {
  value = "${heroku_app.production.web_url}"
}

output "test_url" {
  value = "${heroku_app.test}"
}
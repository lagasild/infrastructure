provider "statuscake" {
    version = "1.0.0"
    username = "lagasild"
}

resource "statuscake_test" "prod" {
    website_name = "app-prod"
    website_url = "${module.heroku.production_url}"
    test_type = "HTTP"
    check_rate = "300"
    contact_group = ["Default Contact Group"]
}
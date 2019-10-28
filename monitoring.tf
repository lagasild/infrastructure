provider "statuscake" {
    version = "1.0.0"
}


# NOTE: I have added tests for staging and prod.

resource "statuscake_test" "staging" {
    website_name = "app-staging-test"
    website_url = "${module.heroku_module.staging_url}devices"
    test_type = "HTTP"
    check_rate = "300"
    contact_group = ["Default Contact Group"]
}

resource "statuscake_test" "production" {
    website_name = "app-production-test"
    website_url = "${module.heroku_module.production_url}devices"
    test_type = "HTTP"
    check_rate = "300"
    contact_group = ["Default Contact Group"]
}
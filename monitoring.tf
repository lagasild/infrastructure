provider "statuscake" {
    version = "1.0.0"
    username = "lagasild"
}

resource "statuscake_test" "prod" {
    website_name = "app-test" #test makes sense for this exam, usually this would be prod.
    website_url = "${module.heroku_module.test_url}devices"
    test_type = "HTTP"
    check_rate = "300"
    contact_group = ["Default Contact Group"]
}
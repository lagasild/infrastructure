provider "opsgenie" {
  version = "0.2.3"
  api_url = "api.eu.opsgenie.com"
}

## Users:
// because it alreayd exists
data "opsgenie_user" "opsgenie_owner" {
  username  = "lagasild_opsgenie_owner@protonmail.com"
}

resource "opsgenie_user" "opsgenie_first_user" {
  username  = "lagasild_opsgenie_first_user@protonmail.com"
  full_name = "First User"
  role      = "User"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}

resource "opsgenie_user" "opsgenie_second_user" {
  username  = "lagasild_opsgenie_second_user@protonmail.com"
  full_name = "Second User"
  role      = "User"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}


## Team
resource "opsgenie_team" "exam_team" {
  name        = "Exam Team"
  description = "Team for demonstrating Opsgenie with Terraform!"

  member {
    id   = "${data.opsgenie_user.opsgenie_owner.id}"
    role = "admin"
  }

  member {
    id   = "${opsgenie_user.opsgenie_first_user.id}"
    role = "user"
  }

  member {
    id   = "${opsgenie_user.opsgenie_second_user.id}"
    role = "user"
  }
}

## Schedule
resource "opsgenie_schedule" "exam_schedule" {
  name          = "Exam Schedule"
  description   = "Schedule for demonstrating Opsgenie with Terraform!"
  timezone      = "Europe/Oslo"
  enabled       = true
  owner_team_id = "${opsgenie_team.exam_team.id}"
}

## Rotation
resource "opsgenie_schedule_rotation" "exam_rotation" {
  schedule_id = "${opsgenie_schedule.exam_schedule.id}"
  name        = "Exam Schedule"
  start_date  = "2019-06-18T17:30:00Z"
  end_date    = "2020-06-20T17:30:00Z"
  type        = "weekly"
  length      = 1

  /*participant { # would assign entire team
    type = "user"
    id   = "${opsgenie_team.exam_team.id}"
  }*/

  participant {
    type = "user"
    id = "${data.opsgenie_user.opsgenie_owner.id}"
  }

  participant {
    type = "user"
    id = "${opsgenie_user.opsgenie_first_user.id}"
  }

  participant {
    type = "user"
    id = "${opsgenie_user.opsgenie_second_user.id}"
  }

  time_restriction {
    type = "time-of-day"
    # NOTE: could also have been set to 24h, as primarily mentioned in class.
    restriction {
      start_hour = 5
      start_min  = 0
      end_hour   = 23
      end_min    = 0
    }
  }
}
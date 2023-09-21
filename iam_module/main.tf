##role-new
resource "google_project_iam_custom_role" "example_role_new" {
  role_id = "CustomRoleExample"
  title   = "Custom Role Item Add"
  description = "A custom role for specific new account permissions add new."
  permissions = [
    "compute.instances.start",
    "compute.instances.stop",
  ]
}

resource "google_project_iam_member" "example_member_new" {
  project = "dulcet-clock-393808"
  role    = google_project_iam_custom_role.example_role_new.name
  member  = "user:risingboy1908@gmail.com"
}
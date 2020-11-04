resource "google_sql_database_instance" "master_db" {
  name             = "psqldbinstance"
  database_version = "POSTGRES_11"
  region           = var.region

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-g1-small"
  }
  deletion_protection  = "false"
}

resource "google_sql_database" "database" {
  name     = "projectdb"
  instance = google_sql_database_instance.master_db.name
}

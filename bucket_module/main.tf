resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = "us-central1"  # Set your desired location
}

resource "google_storage_bucket_object" "example_object_new" {
  name   = "new-file-upload.txt"
  bucket = google_storage_bucket.bucket.name
  source = "C:/Users/INILPTP087/Documents/bucketfile/new-file-upload.txt"  # Path to your local file

  # Optional: You can add more attributes like content_type, content_encoding, etc.
}

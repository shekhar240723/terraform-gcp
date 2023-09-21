provider "google-beta" {
  credentials = file("dulcet-clock-393808-d2ffb904a89c.json")
  project     = "dulcet-clock-393808"
  region      = "us-central1"
}

resource "google_api_gateway_api" "api_cfg" {
  provider = google-beta
  api_id = "my-api-new-section"
}

resource "google_api_gateway_api_config" "api_cfg" {
  provider = google-beta
  api = google_api_gateway_api.api_cfg.api_id
  api_config_id = "my-config-new-one"

  openapi_documents {
    document {
      path = "openapi2-functions.yaml"
      contents = filebase64("./modules/api_gateway/openapi2-functions.yaml")
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

####new-section
resource "google_api_gateway_api" "api_gw" {
  provider = google-beta
  api_id = "my-api-new-setup-one"
}

resource "google_api_gateway_api_config" "api_gw" {
  provider = google-beta
  api = google_api_gateway_api.api_gw.api_id
  api_config_id = "my-config-new-setup-one"

  openapi_documents {
    document {
      path = "openapi2-functions.yaml"
      contents = filebase64("C:/Users/INILPTP087/Documents/Terraform/api-gateway/openapi2-functions.yaml")
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_api_gateway_gateway" "api_gw" {
  provider = google-beta
  api_config = google_api_gateway_api_config.api_gw.id
  gateway_id = "my-gateway-new-setup-one"
}

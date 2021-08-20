module "labels" {
  source = "github.com/norrkin/terraform-null-label"

  environment = "nonprod"
  stage       = "development"
  name        = "backend"
  delimiter   = "-"

  label_order = [
    "name",
    "environment",
    "stage"
  ]

  tags = {
    "created-by" = "terraform"
  }
}
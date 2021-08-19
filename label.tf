module "backend_label" {
  source   = "https://github.com/norrkin/terraform-null-label"

  environment  = "nonprod"
  stage      = "development"
  name       = "backend"
  delimiter  = "-"

  tags = {
    "created-by" = "terraform"
  }
}
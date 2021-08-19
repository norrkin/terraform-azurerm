module "backend_label" {
  source = "github.com/norrkin/terraform-null-label"

  environment = "nonprod"
  stage       = "development"
  name        = "backend"
  delimiter   = "-"

  label_order = ["environment", "stage", "name"]

  tags = {
    "created-by" = "terraform"
  }
}
module "backend_label" {
  source = "github.com/norrkin/terraform-null-label"

  namespace   = "norrkin"
  environment = "nonprod"
  stage       = "development"
  name        = "backend"
  delimiter   = "-"

  label_order = ["namespace", "environment", "stage"]

  tags = {
    "created-by" = "terraform"
  }
}
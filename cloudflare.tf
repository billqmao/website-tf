#Page site
resource "cloudflare_pages_project" "website" {
  account_id        = var.account_id
  name              = var.site_name
  production_branch = "main"
  build_config {
    build_command       = "hugo"
    destination_dir     = "public"
    root_dir            = ""
  }
}

#Custom domain
resource "cloudflare_pages_domain" "site_domain" {
  account_id   = var.account_id
  project_name = var.site_name
  domain       = var.domain
  count = "${var.domain == "" ? 1 : 0}"
}
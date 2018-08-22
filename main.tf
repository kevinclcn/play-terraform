
module "hello" {
  source = "./modules"
  host = "${local.t02}"
}


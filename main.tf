#module "bucket_module" {
#   source      = "./modules/bucket_module"
#   bucket_name = "gcpnewbucketfile123"
#}

#module "iam_module" {
#  source = "./modules/iam_module"
#}

module "firestore_module" {
  source = "./modules/firestore_module"
}

#module "api_gateway" {
#  source = "./modules/api_gateway"
#}


##########

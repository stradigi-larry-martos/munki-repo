# change the following variables

# prefix should be globally unique. Some characters seem to cause issues;
# I'd recommend sticking with lower-case-letters and underscores
# Something like org_yourorg_munki might be a good prefix.
variable "prefix" {
  default = "stradigi_ai_munki"
}

# you'd need to change this only if you have an existing bucket named
# "munki-s3-bucket"
variable "munki_s3_bucket" {
  default = "munki-s3-bucket"
}

# the price class for your CloudFront distribution
# one of PriceClass_All, PriceClass_200, PriceClass_100
variable "price_class" {
  default = "PriceClass_100"
}

# the username your Munki clients will use for BasicAuthentication
variable "username" {
  default = "munki_user"
}

# the password your Munki clients will use for BasicAuthentication
variable "password" {
  default = "v3f7q7Zy%FeZ"
}

# the rest should be able to be left as-is unless you are an expert

# minimum amount of time (in seconds) that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated checks for updates
variable "default_cache_behavior_min_ttl" {
  default = 0
}

# default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header
variable "default_cache_behavior_default_ttl" {
  default = 86400
}

# maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated
variable "default_cache_behavior_max_ttl" {
  default = 31536000
}

# minimum amount of time (in seconds) that you want catalog objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated
variable "catalogs_ordered_cache_behavior_min_ttl" {
  default = 0
}

# default amount of time (in seconds) that a catalog object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header
variable "catalogs_ordered_cache_behavior_default_ttl" {
  default = 30
}

# maximum amount of time (in seconds) that a catalog object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated
variable "catalogs_ordered_cache_behavior_max_ttl" {
  default = 60
}

# minimum amount of time (in seconds) that you want manifest objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated
variable "manifests_ordered_cache_behavior_min_ttl" {
  default = 0
}

# default amount of time (in seconds) that a manifest object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header
variable "manifests_ordered_cache_behavior_default_ttl" {
  default = 30
}

# maximum amount of time (in seconds) that a manifest object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated
variable "manifests_ordered_cache_behavior_max_ttl" {
  default = 60
}

# minimum amount of time (in seconds) that you want icon objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated
variable "icons_ordered_cache_behavior_min_ttl" {
  default = 0
}

# default amount of time (in seconds) that a icon object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header
variable "icons_ordered_cache_behavior_default_ttl" {
  default = 30
}

# maximum amount of time (in seconds) that a icon object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated
variable "icons_ordered_cache_behavior_max_ttl" {
  default = 60
}


# NOTE: currently the _only_ supported provider region is us-east-1.
provider "aws" {
  region  = "us-east-1"
}

module "munki-repo" {
  source  = "larrym/stradigi-ai-munki"
  version = "0.11.14"
  munki_s3_bucket = "${var.munki_s3_bucket}"
  username        = "${var.username}"
  password        = "${var.password}"
  prefix          = "${var.prefix}"
  price_class = "${var.price_class}"
}

# These help you get the information you'll need to do the repo sync
# and to configure your Munki clients to use your new cloud repo

output "cloudfront_url" {
  value = "${module.munki-repo.cloudfront_url}"
}

output "munki_bucket_id" {
  value = "${module.munki-repo.munki_bucket_id}"
}

output "username" {
  value = "${var.username}"
}

output "password" {
  value = "${var.password}"
}

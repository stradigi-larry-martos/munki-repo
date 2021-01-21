variable "username" {
  description = "munki_user"
}

variable "password" {
  description = "{var.password}"
}

variable "munki_s3_bucket" {
  description = "{var.munki_s3_bucket}"
}

variable "prefix" {
  description = "Prefix before lambda and IAM names to ensure uniqueness in your account."
  default     = "munki"
}

variable "price_class" {
  default     = "PriceClass_100"
  description = "The price class your CloudFront Distribution should use."
}

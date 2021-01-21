variable "username" {
  description = "munki_user"
}

variable "password" {
  description = "15OLq!3Kl*O1"
}

variable "munki_s3_bucket" {
  description = "stradigi-ai-munki-repo"
}

variable "prefix" {
  description = "Prefix before lambda and IAM names to ensure uniqueness in your account."
  default     = "munki"
}

variable "price_class" {
  default     = "PriceClass_100"
  description = "The price class your CloudFront Distribution should use."
}

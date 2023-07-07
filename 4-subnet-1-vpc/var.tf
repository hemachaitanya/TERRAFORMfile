variable "region" {
  type    = string
  default = "us-east-2"

}
variable "vpc" {
  type = object({
    cidr_block = string
    name       = string
  })

}
variable "subnet" {
  type = object({
    vpc_id = string
  })

}
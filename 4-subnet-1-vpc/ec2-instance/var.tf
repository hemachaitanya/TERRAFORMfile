variable "region" {
  type = object({
    region = string
  })
}
variable "vpc-1" {
  type = object({
    cidr_block = string
    name       = string
  })
}
variable "subnet-1" {
  type = object({
    cidr_block = string
    name       = string
  })
}
variable "igw" {
  type = object({
    name = string


  })
}

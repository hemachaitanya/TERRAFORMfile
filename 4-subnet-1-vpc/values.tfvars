region = "us-east-1"
vpc = {
  cidr_block = "192.168.0.0/16"
  name       = "onevpc"
}
subnet = {
  vpc_id = "aws_vpc.one-vpc.id"
}
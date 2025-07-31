terraform {
  required_version = "~> 1.0"
}

# uncomment the following block to see the error
# resource "aws_instance" "foo" {
#   ami           = "ami-0ff8a91507f77f867"
#   instance_type = "t1.2xlarge" # invalid type!
# }

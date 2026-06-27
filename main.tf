# Create the Foundation VPC
resource "aws_vpc" "foundation_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "Foundation-VPC"
        Environment = "Foundation"
        ManagedBy = "Terraform"
        Architecture = "Lead-engineering"
    }

}
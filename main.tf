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

#1. Create a puvblic subnet in the VPC(For Web Servers / Load Balancers)

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.foundation_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"   
    map_public_ip_on_launch = true #gives public IP auromatically to the instances launched in this subnet

    tags = {
        Name = "Ayutech-Public-Subnet"
        
    }
}

#2. create a private subnet for secure AI modules and databases 
resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.foundation_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    tags = {
        Name = "Ayutech-Private-Subnet"
        
    }
}

#3. Create an Internet Gateway for the VPC
resource "aws_internet_gateway" "foundation_igw" {
    vpc_id = aws_vpc.foundation_vpc.id

    tags = {
        Name = "Ayutech-IGW"
        
    }
}

#4. Create a route table for the public subnet
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.foundation_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.foundation_igw.id
    }
    tags = {
        Name = "Ayutech-Public-Route-Table"
        
    }
}

#5. Associate the public subnet with the route table
resource "aws_route_table_association" "public_route_table_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route_table.id
}
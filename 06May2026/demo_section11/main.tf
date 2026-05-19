
# Fetch Existing VPC
# Option 1: By VPC ID
# -----------------------------------
data "aws_vpc" "Bootcamp-vpc-do-not-delete-vpc" {
  id = "vpc-02358ddc1cb955bcd"
}

data "aws_nat_gateway" "Bootcamp-vpc-do-not-delete-nat" {
  id = "nat-054be5efc41467fef"
}

# -----------------------------------
# Create Subnet in Existing VPC
# -----------------------------------
resource "aws_subnet" "pavan_subnet" {
  vpc_id                  = data.aws_vpc.Bootcamp-vpc-do-not-delete-vpc.id
  cidr_block              = "10.0.112.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "pavan_private_subnet"
    Owner = "pavan.randive@einfochips.com",
    Department = "PES",
    Project_Name = "EIC Internal - DevOps Bootcamp Training",
    Terraform = "TRUE",
    BU = "Intelligent Automation"

  }
}


resource "aws_route_table" "pavan_private_rt" {
  vpc_id = data.aws_vpc.Bootcamp-vpc-do-not-delete-vpc.id
  
 
  tags = {
    Name = "pavan_private_routetable"
    Owner = "pavan.randive@einfochips.com",
    Department = "PES",
    Project_Name = "EIC Internal - DevOps Bootcamp Training",
    Terraform = "TRUE",
    BU = "Intelligent Automation"

  }
}
resource "aws_route" "public_default" {
  route_table_id         = aws_route_table.pavan_private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = data.aws_nat_gateway.Bootcamp-vpc-do-not-delete-nat.id
}

# resource "aws_route" "private_default" {
#   route_table_id         = aws_route_table.pavan_private_rt.id
#   destination_cidr_block = "10.0.0.0/16"
  
# }
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.pavan_subnet.id
  route_table_id = aws_route_table.pavan_private_rt.id
}
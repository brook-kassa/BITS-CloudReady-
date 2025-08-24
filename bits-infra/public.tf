data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  az_count        = 3
  azs             = slice(data.aws_availability_zones.available.names, 0, local.az_count)
  public_newbits  = 4
  private_newbits = 4
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "bits-${var.environment}-igw"
  }
}
resource "aws_subnet" "public" {
  for_each = zipmap(local.azs, range(length(local.azs)))

  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.key
  cidr_block              = cidrsubnet(var.vpc_cidr, local.public_newbits, each.value)
  map_public_ip_on_launch = true

  tags = {
    Name = "bits-${var.environment}-public-${each.key}"
    Tier = "public"
  }
}

resource "aws_subnet" "private" {
  for_each = zipmap(local.azs, range(length(local.azs)))

  vpc_id            = aws_vpc.main.id
  availability_zone = each.key
  cidr_block        = cidrsubnet(var.vpc_cidr, local.private_newbits, each.value + 8)

  tags = {
    Name = "bits-${var.environment}-private-${each.key}"
    Tier = "private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "bits-${var.environment}-rt-public"
  }
}

resource "aws_route" "public_default" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat" {
  domain = "vpc"
  tags = {
    Name = "bits-${var.environment}-nat-eip"
  }
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[local.azs[0]].id

  tags = {
    Name = "bits-${var.environment}-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
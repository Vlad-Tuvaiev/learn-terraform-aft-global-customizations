# Создание VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My test VPC"
  }
}

# Создание подсети внутри VPC
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-north-1a" # Указываем зону доступности в eu-north-1
  tags = {
    Name = "My test Subnet"
  }
}

# Создание интернет-шлюза для подключения инстанса к интернету
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "My test IGW"
  }
}

# Создание таблицы маршрутизации
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "My test Route Table"
  }
}

# Ассоциирование маршрутизатора с подсетью
resource "aws_route_table_association" "my_subnet_association" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}

# Добавление маршрута для интернет-доступа
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}

# Создание EC2-инстанса
resource "aws_instance" "my_vm" {
  ami           = "ami-02db68a01488594c5" # Используйте нужный AMI
  instance_type = "t3.micro"

  # Указываем подсеть, созданную в VPC
  subnet_id = aws_subnet.my_subnet.id

  tags = {
    Name = "My test VM"
  }
}

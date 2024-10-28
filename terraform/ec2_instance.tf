resource "aws_instance" "my_vm" {
  ami           = "ami-0c55b159cbfafe1f0" # Используй нужный AMI
  instance_type = "t2.micro"

  tags = {
    Name = "My test VM"
  }
}

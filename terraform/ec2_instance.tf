resource "aws_instance" "my_vm" {
  ami           = "ami-02db68a01488594c5" # Используй нужный AMI
  instance_type = "t2.micro"

  tags = {
    Name = "My test VM"
  }
}

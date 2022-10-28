resource "aws_key_pair" "terraform_server_key" {
  key_name   = replace(local.name, "rtype", "TerraformServerKey")
  public_key = file("~/.ssh/id_rsa.pub")
}
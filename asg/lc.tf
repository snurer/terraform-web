resource "aws_launch_configuration" "main" {
  name            = replace(local.name, "rtype", "main-lc")
  image_id        = data.aws_ami.amazon_linux_2.image_id
  instance_type   = var.instance_type
  user_data       = data.template_file.userdata.rendered
  security_groups = [aws_security_group.main.id]
  key_name        = aws_key_pair.terraform_server_key.key_name
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_key_pair" "terraform_server_key" {
  key_name   = replace(local.name, "rtype", "Terraform-Server-Key")
  public_key = file("~/.ssh/id_rsa.pub")
}
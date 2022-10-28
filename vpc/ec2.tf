resource "aws_instance" "dev_instance" {
  count                  = 1
  ami                    = data.aws_ami.amazon_linux_2.image_id
  instance_type          = var.instance_type
  subnet_id              = element(aws_subnet.public_subnet.*.id, count.index)
  vpc_security_group_ids = [aws_security_group.main.id]
  user_data              = data.template_file.user_data.rendered
  key_name               = aws_key_pair.terraform_server_key.key_name


  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "dev_instance")
    }
  )
}


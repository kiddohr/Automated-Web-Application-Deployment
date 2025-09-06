variable "subnet_id" {}
variable "control_plane_sg" {}
variable "worker_node_sg" {}


resource "aws_instance" "control_plane" {
  ami = var.ami
  instance_type = var.instance_type

  subnet_id = var.subnet_id
  security_groups = [var.control_plane_sg]

  tags = {
    Name = "ControlPlane"
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    delete_on_termination = true
  }
  
}

resource "aws_instance" "worker_node" {
  ami = var.ami
  instance_type = var.instance_type

  subnet_id = var.subnet_id
  security_groups = [var.worker_node_sg]

  count = 2

  tags = {
    Name = "WorkerNode"
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    delete_on_termination = true
  }

}
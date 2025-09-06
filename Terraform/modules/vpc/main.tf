resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subnet_range
}

resource "aws_security_group" "control_plane" {
  name = "control_plane_sg"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "Kubelet API server"
    from_port = var.Kubelet_Api_server
    to_port = var.Kubelet_Api_server
    protocol = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  ingress {
    description = "etcd client server"
    from_port = var.etcd_client_server_from
    to_port = var.etcd_client_server_to
    protocol = "tcp"
    cidr_blocks = [var.cidr_block]
  }
  
  ingress {
    description = "Kubelet API"
    from_port = var.Kubelet_API
    to_port = var.Kubelet_API
    protocol = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  ingress {
    description = "kube scheduler"
    from_port = var.Kube_Scheduler
    to_port = var.Kube_Scheduler
    protocol = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  ingress {
    description = "kube-controller-manager"
    from_port = var.kube_control_mannager
    to_port = var.kube_control_mannager
    protocol = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  ingress {
    description = "SSH"
    from_port = var.ssh
    to_port = var.ssh
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "worker_node" {
  name = "worker_node"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "Kubelet API"
    from_port = var.Kubelet_API
    to_port = var.Kubelet_API
    protocol = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  ingress {
    description = "kube-proxy"
    from_port = var.kube_proxy
    to_port = var.kube_proxy
    protocol = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  ingress {
    description = "NodePort Service"
    from_port = var.NodePort_services_from
    to_port = var.NodePort_services_to
    protocol = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  ingress {
    description = "NodePort Services"
    from_port = var.NodePort_services_from
    to_port = var.NodePort_services_to
    protocol = "udp"
    cidr_blocks = [var.cidr_block]
  }

  ingress {
    description = "SSH"
    from_port = var.ssh
    to_port = var.ssh
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
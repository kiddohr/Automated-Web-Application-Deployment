variable "cidr_block" {
  default = "192.168.0.0/24"
}

variable "subnet_range" {
  default = "192.168.0.0/25"
}

variable "Kubelet_Api_server" {
  default = 6443
}

variable "etcd_client_server_from" {
  default = 2379
}

variable "etcd_client_server_to" {
  default = 2380
}

variable "Kubelet_API" {
  default = 10250
}

variable "Kube_Scheduler" {
  default = 10259
}

variable "kube_control_mannager" {
  default = 10257
}

variable "ssh" {
  default = 22
}

variable "kube_proxy" {
  default = 10256
}

variable "NodePort_services_from" {
  default = 30000
}

variable "NodePort_services_to" {
  default = 32767
}
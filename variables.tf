variable "environment_name" {
  type = string
}

variable "nodes" {
  type = list(object({
    address = string
    user = string
    role = list(string)
    ssh_key = string
  }))
}

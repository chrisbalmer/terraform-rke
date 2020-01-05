resource "rke_cluster" "cluster" {
  cluster_name = var.environment_name

  dynamic nodes {
    for_each = var.nodes

    content {
      address = nodes.value.address
      user    = nodes.value.user
      role    = nodes.value.role
      ssh_key = file(nodes.value.ssh_key)
    }
  }

  # TODO: Make variable, default on
  ingress {
    provider = "none"
  }
}

resource "local_file" "kube_cluster_yaml" {
 filename = "${format("%s/%s" , path.root, "kube_config_cluster.yml")}"
 content = "${rke_cluster.cluster.kube_config_yaml}"
}

resource "local_file" "rke_cluster_yaml" {
 filename = "${format("%s/%s", path.root, "rke_config_cluster.yml")}"
 content = "${rke_cluster.cluster.rke_cluster_yaml}"
}
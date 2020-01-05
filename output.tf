output "cluster" {
  value = rke_cluster.cluster
}

output "kubeconfig_file" {
  value = local_file.kube_cluster_yaml.filename
}

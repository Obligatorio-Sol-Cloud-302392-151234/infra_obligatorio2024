resource "null_resource" "run_local_command" {
  provisioner "local-exec" {
    command = "bash deploy/deploy_k8s.sh ${var.region} ${var.app_eks_cluster} ${var.profile}"
  }  
}




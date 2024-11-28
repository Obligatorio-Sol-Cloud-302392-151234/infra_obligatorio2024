resource "null_resource" "run_local_command" {
  provisioner "local-exec" {
    command = "bash modules\\deployment\\deploy_k8s.sh ${var.region} ${var.app_eks_cluster} ${var.profile}"
  }  
}




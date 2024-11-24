resource "null_resource" "run_local_command" {
  provisioner "local-exec" {
    command = <<EOT
      aws eks update-kubeconfig --region ${var.region} --name ${var.app_eks_cluster} --alias ${app_eks_cluster.name} --profile ${profile}
      bash deploy/deploy_k8s.sh
    EOT
  }
  
}




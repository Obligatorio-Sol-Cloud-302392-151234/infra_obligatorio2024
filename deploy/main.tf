resource "null_resource" "run_local_command" {
  provisioner "local-exec" {
    command = "./deploy/deploy_k8s.sh"
  }
  depends_on = [ aws_eks_cluster.app-eks ]
}




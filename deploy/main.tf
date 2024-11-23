resource "null_resource" "run_local_command" {
  provisioner "local-exec" {
    command = "kubectl apply -f ${Microservicios/src/adservice/deployment}/*.yaml"
  }
  depends_on = [ aws_eks_cluster.app-eks ]
}




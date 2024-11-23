resource "null_resource" "run_local_command" {
  provisioner "local-exec" {
    command = "bash deploy/deploy_k8s.sh"
  }
  
}




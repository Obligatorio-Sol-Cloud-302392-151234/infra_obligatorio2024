data "template_file" "img_manifest" {
  template = "${file("${var.manifest_adservice}")}"
  vars = {
    docker_img = var.adservice_img
  }
}
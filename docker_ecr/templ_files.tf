data "template_file" "img_manifest" {
  for_each = aws_ecr_repository.repository

  template = file("manifests/${each.key}/kubernetes-manifests.yaml")

  vars = {
    docker_img = each.value.repository_url
  }
}

resource "local_file" "k8s_manifests" {
  depends_on = [data.template_file.img_manifest]

  for_each = data.template_file.img_manifest

  filename = "generated/${each.key}.yaml"
  
  # Reemplazar solo docker_img en el contenido generado
  content = replace(each.value.rendered, "{{docker_img}}", each.value.repository_url)  
}

# data "template_file" "img_manifest" {
#   for_each = toset(var.repository_list)
  
#   template = "${file("${["manifest_${each.key}"]}")}"
#   vars = {
#     docker_img = aws_ecr_repository.repository[each.key].repository_url
#   }
# }







# data "template_file" "img_manifest_adservice" {
#   template = "${file("${var.manifest_adservice}")}"
#   vars = {
#     docker_img = data.aws_ecr_repository.adservice.repository_url
#   }
# }

# data "template_file" "img_manifest_checkoutservice" {
#   template = "${file("${var.manifest_checkoutservice}")}"
#   vars = {
#     docker_img = data.aws_ecr_repository.checkoutservice.repository_url
#   }
# }

# data "template_file" "img_manifest_currencyservice" {
#   template = "${file("${var.manifest_currencyservice}")}"
#   vars = {
#     docker_img = data.aws_ecr_repository.currencyservice.repository_url
#   }
# }

# data "template_file" "img_manifest_emailservice" {
#   template = "${file("${var.manifest_emailservice}")}"
#   vars = {
#     docker_img = data.aws_ecr_repository.emailservice.repository_url
#   }
# }

# data "template_file" "img_manifest_frontend" {
#   template = "${file("${var.manifest_frontend}")}"
#   vars = {
#     docker_img = data.aws_ecr_repository.frontend.repository_url
#   }
# }

# data "template_file" "img_manifest_loadgenerator" {
#   template = "${file("${var.manifest_loadgenerator}")}"
#   vars = {
#     docker_img = data.aws_ecr_repository.loadgenerator.repository_url
#   }
# }
# data "template_file" "img_manifest_paymentservice" {
#   template = "${file("${var.manifest_paymentservice}")}"
#   vars = {
#     docker_img = data.aws_ecr_repository.paymentservice.repository_url
#   }
# }

# data "template_file" "img_manifest_productcatalogservice" {
#   template = "${file("${var.manifest_productcatalogservice}")}"
#   vars = {
#     docker_img = data.aws_ecr_repository.productcatalogservice.repository_url
#   }
# }

# data "template_file" "img_manifest_recommendationservice" {
#   template = "${file("${var.manifest_recommendationservice}")}"
#   vars = {
#     docker_img = data.aws_ecr_repository.recommendationservice.repository_url
#   }
# }
# data "template_file" "img_manifest_shippingservice" {
#   template = "${file("${var.manifest_shippingservice}")}"
#   vars = {
#     docker_img = data.aws_ecr_repository.shippingservice.repository_url
#   }
# }


# resource "local_file" "generated_yaml" {
#   for_each = toset(var.repository_list)

#   filename = "generated/${each.key}.yaml"  # Nombre del archivo generado
#   content  = data.template_file.img_manifest[each.key].rendered  # Contenido del template generado
# }



# resource "local_file" "adservice_yaml" {
#   filename = "generated/adservice.yaml"
#   content  = data.template_file.img_manifest_adservice.rendered
# }

# resource "local_file" "checkoutservice_yaml" {
#   filename = "generated/checkoutservice.yaml"
#   content  = data.template_file.img_manifest_checkoutservice.rendered
# }

# resource "local_file" "currencyservice_yaml" {
#   filename = "generated/currencyservice.yaml"
#   content  = data.template_file.img_manifest_currencyservice.rendered
# }

# resource "local_file" "emailservice_yaml" {
#   filename = "generated/emailservice.yaml"
#   content  = data.template_file.img_manifest_emailservice.rendered
# }

# resource "local_file" "frontend_yaml" {
#   filename = "generated/frontend.yaml"
#   content  = data.template_file.img_manifest_frontend.rendered
# }

# resource "local_file" "loadgenerator_yaml" {
#   filename = "generated/loadgenerator.yaml"
#   content  = data.template_file.img_manifest_loadgenerator.rendered
# }

# resource "local_file" "paymentservice_yaml" {
#   filename = "generated/paymentservice.yaml"
#   content  = data.template_file.img_manifest_paymentservice.rendered
# }

# resource "local_file" "productcatalogservice_yaml" {
#   filename = "generated/productcatalogservice.yaml"
#   content  = data.template_file.img_manifest_productcatalogservice.rendered
# }

# resource "local_file" "recommendationservice_yaml" {
#   filename = "generated/recommendationservice.yaml"
#   content  = data.template_file.img_manifest_recommendationservice.rendered
# }

# resource "local_file" "shippingservice_yaml" {
#   filename = "generated/shippingservice.yaml"
#   content  = data.template_file.img_manifest_shippingservice.rendered
# }


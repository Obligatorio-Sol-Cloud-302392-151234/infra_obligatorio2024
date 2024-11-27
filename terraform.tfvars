region          = "us-east-1"
azone           = ["us-east-1a", "us-east-1b"]
network_cidr    = "10.0.0.0/16"
public          = ["10.0.0.0/24", "10.0.1.0/24"]
private         = ["10.0.2.0/24", "10.0.3.0/24"]
instance_type   = "t3.medium"
profile         = "default"
app_eks_cluster = "app_eks_cluster"
repository_list = ["adservice", "checkoutservice", "currencyservice", "emailservice", "frontend", "loadgenerator", "paymentservice", "productcatalogservice", "recommendationservice", "shippingservice"]


#adservice_img = data.aws_ecr_repository.adservice.repository_url
manifest_adservice = "manifests/adservice/kubernetes-manifests.yaml"

#checkoutservice_img = data.aws_ecr_repository.checkoutservice.repository_url
manifest_checkoutservice = "manifests/checkoutservice/kubernetes-manifests.yaml"

#currencyservice_img = data.aws_ecr_repository.currencyservice.repository_url
manifest_currencyservice = "manifests/currencyservice/kubernetes-manifests.yaml"

#emailservice_img = data.aws_ecr_repository.emailservice.repository_url
manifest_emailservice = "manifests/emailservice/kubernetes-manifests.yaml"

#frontend_img = data.aws_ecr_repository.frontend.repository_url
manifest_frontend = "manifests/frontend/kubernetes-manifests.yaml"

#loadgenerator_img = data.aws_ecr_repository.loadgenerator.repository_url
manifest_loadgenerator = "manifests/loadgenerator/kubernetes-manifests.yaml"

#paymentservice_img = data.aws_ecr_repository.paymentservice.repository_url
manifest_paymentservice = "manifests/paymentservice/kubernetes-manifests.yaml"

#productcatalogservice_img = data.aws_ecr_repository.productcatalogservice.repository_url
manifest_productcatalogservice = "manifests/productcatalogservice/kubernetes-manifests.yaml"

#recommendationservice_img = data.aws_ecr_repository.recommendationservice.repository_url
manifest_recommendationservice = "manifests/recommendationservice/kubernetes-manifests.yaml"

#shippingservice_img = data.aws_ecr_repository.shippingservice.repository_url
manifest_shippingservice = "manifests/shippingservice/kubernetes-manifests.yaml"
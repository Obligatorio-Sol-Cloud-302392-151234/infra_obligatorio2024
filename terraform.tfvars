region          = "us-east-1"
azone           = ["us-east-1a", "us-east-1b"]
network_cidr    = "10.0.0.0/16"
public          = ["10.0.0.0/24", "10.0.1.0/24"]
private         = ["10.0.2.0/24", "10.0.3.0/24"]
instance_type   = "t3.medium"
profile         = "default"
app_eks_cluster = "app_eks_cluster"
repository_list = ["adservice", "cartservice", "checkoutservice", "currencyservice", "emailservice", "frontend", "loadgenerator", "paymentservice", "productcatalogservice", "recommendationservice", "shippingservice"]

host_docker     = "npipe:////./pipe/docker_engine" # Para equipos con windows

#host_docker    = "unix:///var/run/docker.sock" # Para equipos con Linux/macOS



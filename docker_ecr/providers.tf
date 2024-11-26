terraform {
  required_providers {
    
    docker = {
        source = "kreuzwerker/docker"
        version = "2.15.0"
    }
  }
}

provider "docker" {
    host = "npipe:////./pipe/docker_engine"
    registry_auth {
      address = local.aws_ecr_url
      username = data.aws_ecr_authorization_token.token.user_name
      password = data.aws_ecr_authorization_token.token.password
    }
  
}
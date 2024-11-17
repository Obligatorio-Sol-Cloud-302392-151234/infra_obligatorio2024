resource "aws_eks_cluster" "basic" {
  name     = "basic-cluster"
  role_arn = "arn:aws:iam::695788816269:role/LabRole"

  vpc_config {
    subnet_ids         = [aws_subnet.practico-terraform-subnet.id, aws_subnet.practico-terraform-subnet2.id]
    security_group_ids = [aws_security_group.test-terraform-sg.id]
  }

}

resource "aws_launch_template" "node_group_lt" {
  name_prefix = "eks-node-group-lt"

  network_interfaces {
    security_groups = [aws_security_group.test-terraform-sg2.id]
  }

  instance_type = "t2.micro" # Tipo de instancia para los nodos
}



resource "aws_eks_node_group" "managed" {
  cluster_name    = aws_eks_cluster.basic.name
  node_group_name = "basic-node-group"
  node_role_arn   = "arn:aws:iam::695788816269:role/LabRole"
  subnet_ids      = [aws_subnet.practico-terraform-subnet.id, aws_subnet.practico-terraform-subnet2.id]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }
  launch_template {
    id      = aws_launch_template.node_group_lt.id
    version = "$Latest"

  }
}

resource "aws_eks_fargate_profile" "kafka_east_2" {
  cluster_name           = aws_eks_cluster.cluster.name
  fargate_profile_name   = "kafkaeast2"
  pod_execution_role_arn = aws_iam_role.eks-fargate-profile.arn

  # These subnets must have the following resource tag: 
  # kubernetes.io/cluster/<CLUSTER_NAME>.
  subnet_ids = [
    var.private_subnetA,
    var.private_subnetB,
    var.private_subnetC
  ]

  selector {
    namespace = "kafkaeast2"
  }
}

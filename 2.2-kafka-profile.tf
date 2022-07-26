resource "aws_eks_fargate_profile" "kafka" {
  cluster_name           = aws_eks_cluster.cluster.name
  fargate_profile_name   = "${var.cluster_name}-${var.AWS_DEFAULT_REGION}-fargate-kafka-profile"
  pod_execution_role_arn = aws_iam_role.eks-fargate-profile.arn

  # These subnets must have the following resource tag: 
  # kubernetes.io/cluster/<CLUSTER_NAME>.
  subnet_ids = [
      data.aws_ssm_parameter.rlv-PriSubA_ID.value,
      data.aws_ssm_parameter.rlv-PriSubB_ID.value,
      data.aws_ssm_parameter.rlv-PriSubC_ID.value
  ]

  selector {
    namespace = "kafka-${var.AWS_DEFAULT_REGION}"
  }
}

resource "helm_release" "aws-load-balancer-controller" {
  name = "${var.cluster_name}-${var.AWS_DEFAULT_REGION}-ws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  version    = "1.4.1"

  set {
    name  = "clusterName"
    value = aws_eks_cluster.cluster.id
  }

  set {
    name  = "image.tag"
    value = "v2.4.2"
  }

  set {
    name  = "replicaCount"
    value = 1
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.aws_load_balancer_controller.arn
  }

  # EKS Fargate specific
  set {
    name  = "region"
    value = var.AWS_DEFAULT_REGION
  }

  set {
    # name  = "vpcId"
    name  = "${data.aws_ssm_parameter.rlv-VpcId}"
    # value = aws_vpc.main.id
    value  = "${data.aws_ssm_parameter.rlv-VpcId}"
  }

  depends_on = [aws_eks_fargate_profile.kube-system]
}
resource "aws_iam_role" "eks-cluster" {
  name = "${var.cluster_name}-${var.AWS_DEFAULT_REGION}-eks-fargate-cluster-iamrole"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "amazon-eks-cluster-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-cluster.name
}

resource "aws_eks_cluster" "cluster" {
  name     = "${var.cluster_name}-${var.AWS_DEFAULT_REGION}-eks-fargate-cluster"
  version  = var.cluster_version
  role_arn = aws_iam_role.eks-cluster.arn

  vpc_config {

    endpoint_private_access = false
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]

    subnet_ids = [
      data.aws_ssm_parameter.rlv-PriSubA_ID.value,
      data.aws_ssm_parameter.rlv-PriSubB_ID.value,
      data.aws_ssm_parameter.rlv-PriSubC_ID.value,
      data.aws_ssm_parameter.rlv-PubSubA_ID.value,
      data.aws_ssm_parameter.rlv-PubSubB_ID.value,
      data.aws_ssm_parameter.rlv-PubSubC_ID.value  
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.amazon-eks-cluster-policy]
}

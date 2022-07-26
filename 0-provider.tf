provider "aws" {
  region = var.AWS_DEFAULT_REGION
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "helm" {

  kubernetes {
    host                   = aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.cluster.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.default.token
    # exec {
    #   api_version = "client.authentication.k8s.io/v1beta1"
    #   args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.cluster.id]
    #   command     = "aws"
    # }
  }
}

data "aws_eks_cluster" "default" {
  name = aws_eks_cluster.cluster.name
  depends_on = [aws_eks_cluster. cluster]
}

data "aws_eks_cluster_auth" "default" {
  name = aws_eks_cluster.cluster.name
  depends_on = [aws_eks_cluster. cluster]
}
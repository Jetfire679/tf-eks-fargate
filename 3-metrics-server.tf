resource "helm_release" "metrics_server" {
    name = "metrics-server"

    repository       = "https://charts.bitnami.com/bitnami"
    chart            = "${var.cluster_name}-${var.AWS_DEFAULT_REGION}-metrics-server"
    namespace        = "metrics-server"
    version          = "6.0.8"
    create_namespace = true

    set {
        name  = "apiService.create"
        value = "true"
    }
}


# resource "helm_release" "metrics-server" {
#   name = "metrics-server"

#   repository = "https://kubernetes-sigs.github.io/metrics-server/"
#   chart      = "metrics-server"
#   namespace  = "kube-system"
#   version    = "3.8.1"

#   set {
#     name  = "metrics.enabled"
#     value = false
#   }

#   depends_on = [aws_eks_fargate_profile.kube-system]
# }
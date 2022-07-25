resource "helm_release" "metrics-server" {
  name = "strimzi-kafka-operator"

  repository = "https://strimzi.io/charts/"
  chart      = "strimzi-kafka-operator"
  namespace  = "kafkaeast1"
  version    = "0.28.0"

  # set {
  #   name  = "metrics.enabled"
  #   value = false
  # }

  depends_on = [aws_eks_fargate_profile.kube-system]
}

resource "helm_release" "strimzi-kafka-operator" {
  name = "strimzi-kafka-operator"

  repository = "https://strimzi.io/charts/"
  chart      = "strimzi-kafka-operator"
  namespace  = "kafkaeast1"
  version    = "0.30.0"

  # set {
  #   name  = "metrics.enabled"
  #   value = false
  # }

  depends_on = [aws_eks_fargate_profile.kube-system]
}

resource "helm_release" "strimzi-kafka-operator-east-2" {
  name = "strimzi-kafka-operator-2"

  repository = "https://strimzi.io/charts/"
  chart      = "strimzi-kafka-operator"
  namespace  = "kafkaeast2"
  version    = "0.30.0"

  # set {
  #   name  = "metrics.enabled"
  #   value = false
  # }

  depends_on = [aws_eks_fargate_profile.kube-system]
}
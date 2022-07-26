resource "helm_release" "strimzi-kafka-operator-east1" {
  name = "strimzi-kafka-operator"

  repository = "https://strimzi.io/charts/"
  chart      = "strimzi-kafka-operator"
  namespace  = "kafka-${var.AWS_DEFAULT_REGION}"
  create_namespace = true
  version    = "0.30.0"

  depends_on = [aws_eks_fargate_profile.kube-system]
}

# resource "helm_release" "strimzi-kafka-operator-east2" {
#   name = "strimzi-kafka-operator-east2"

#   repository = "https://strimzi.io/charts/"
#   # chart      = "strimzi-kafka-operator"
#   chart      = "./kube/strimzi-kafka-operator-east2"
#   namespace  = "kafkaeast2"
#   create_namespace = true
#   version    = "0.30.0"

#   depends_on = [aws_eks_fargate_profile.kube-system]
# }
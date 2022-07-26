# resource "helm_release" "strimzi-kafka-operator-east1" {
#   name = "strimzi-kafka-operator"

#   repository = "https://strimzi.io/charts/"
#   chart      = "strimzi-kafka-operator"
#   namespace  = "kafkaeast1"
#   # create_namespace = true
#   version    = "0.30.0"

#   depends_on = [aws_eks_fargate_profile.kube-system]
# }

resource "helm_release" "metrics_server" {
    name = "metrics-server"

    repository       = "https://charts.bitnami.com/bitnami"
    chart            = "metrics-server"
    namespace        = "metrics-server"
    version          = "5.11.1"
    create_namespace = true

    set {
        name  = "apiService.create"
        value = "true"
    }
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
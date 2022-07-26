# provider "random" {
#   version = "~> 2.3.0"
# }



# module "kowl" {
#   source = "git::https://github.com/cloudhut/terraform-modules.git//modules/kowl?ref=v2.0.0"

#   # Deployment
#   deployment_replicas       = 1
#   deployment_kowl_image     = "quay.io/cloudhut/kowl"
#   deployment_kowl_image_tag = "v1.1.0"
#   kowl_config               = file("${path.module}/config.yaml")

#   # Ingress
#   ingress_enabled     = true
#   ingress_annotations = {
#     "kubernetes.io/ingress.class" = "nginx"
#     "kubernetes.io/tls-acme"      = "true"
#   }
#   ingress_host        = "kowl.test.vignali.rocks"

#   # Kubernetes
#   kubernetes_host                   = "https://${aws_eks_cluster.cluster.endpoint}"
#   kubernetes_token                  = data.aws_eks_cluster_auth.default.token
#   kubernetes_cluster_ca_certificate = base64decode(aws_eks_cluster.cluster.certificate_authority[0].data)
# }
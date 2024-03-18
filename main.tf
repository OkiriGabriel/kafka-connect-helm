resource "helm_release" "cp-kafka-connect" {
  name       = "cp-kafka-connect"
  repository = "https://confluentinc.github.io/cp-helm-charts/"
  chart      = "cp-helm-charts"
  version    = " 0.6.1"


  set {
    name  = "cp-schema-registry.enabled"
    value = "false"
  }

  set {
    name  = "cp-kafka-rest.enabled"
    value = "false"
  }

  set {
    name  = "cp-kafka-connect.enabled"
    value = "f"
  }
  set {
    name  = "installCRDs"
    value = "true"
  }
#   set {
#     name  = "kafka.connect.enabled"
#     value = "true"
#   }

#   set {
#     name  = "kafka.connect.config.storage.topic"
#     value = "kafka-connect-configs"
#   }

#   set {
#     name  = "kafka.connect.offset.storage.topic"
#     value = "kafka-connect-offsets"
#   }

#   set {
#     name  = "kafka.connect.status.storage.topic"
#     value = "kafka-connect-status"
#   }

  namespace = "cp-kafka-connect"

    values = [
    "${data.template_file.cp-helm-charts-values.rendered}",
  ]
}


data "template_file" "cp-helm-charts-values" {
  template = "${file("${path.module}/charts/cp-helm-charts-values.yaml")}"
}
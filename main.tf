resource "helm_release" "kafka_connector" {
  name       = "my-confluent-oss"
  repository = "https://confluentinc.github.io/cp-helm-charts/"
  chart      = "cp-helm-charts"
  version    = "0.1.0"


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

  namespace = "my-confluent-oss"
}

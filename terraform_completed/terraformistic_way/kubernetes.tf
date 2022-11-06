resource "kubernetes_deployment" "myapp" {
  metadata {
    name = var.app_name
    labels = local.labels
  }

  spec {
    replicas = var.deployment_replicas

    selector {
      match_labels = local.labels
    }

    template {
      metadata {
        labels = local.labels
      }

      spec {
        init_container {
          name = "sleep"
          image = "busybox:latest"
          command = ["sh", "-c", "sleep 30"]
        }
        container {
          image = var.deployment_image
          name  = var.app_name

          liveness_probe {
            tcp_socket {
              port = "8080"
            }
            initial_delay_seconds = 5
            period_seconds        = 20
          }
          readiness_probe {
            tcp_socket {
              port = "8080"
            }
            initial_delay_seconds = 20
            period_seconds        = 20
          }
          lifecycle {
            pre_stop {
              exec {
                command = ["sh", "-c", "echo I'm being deleted & sleep 10"]
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "myapp" {
  metadata {
    name = var.app_name
    labels = local.labels
  }
  spec {
    selector = {
      app = kubernetes_deployment.myapp.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 8080
    }

    type = "ClusterIP"
  }
}
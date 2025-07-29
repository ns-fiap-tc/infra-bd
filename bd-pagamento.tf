resource "kubernetes_secret" "secrets-mongodbpag" {
  metadata {
    name = "secrets-mongodbpag"
  }

  type = "Opaque"

  data = {
    MONGO_INITDB_ROOT_USERNAME  = var.db_pagamento_username
    MONGO_INITDB_ROOT_PASSWORD  = var.db_pagamento_password
    MONGO_INITDB_DATABASE       = var.db_pagamento_name
  }

  lifecycle {
    prevent_destroy = false
  }
}


# Deployment do MongoDB
resource "kubernetes_deployment" "mongodbpag-deployment" {
  metadata {
    name = "mongodbpag"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "mongodbpag"
      }
    }
    template {
      metadata {
        labels = {
          app = "mongodbpag"
        }
      }
      spec {
        container {
          name  = "mongodbpag"
          image = "mongo:latest"
          port {
            container_port = 27017
          }
          env_from {
            secret_ref {
              name = kubernetes_secret.secrets-mongodbpag.metadata[0].name
            }
          }
          args = ["--auth"]
          # port {
          #   container_port = 15672
          # }
        }
      }
    }
  }
}

# Serviço do MongoDB
resource "kubernetes_service" "mongodbpag-service" {
  metadata {
    name = "mongodbpag"
  }
  spec {
    selector = {
      app = "mongodbpag"
    }
    port {
      name        = "service"
      protocol    = "TCP"
      port        = 27017
      target_port = 27017
    }
    # port {
    #   name        = "web"
    #   protocol    = "TCP"
    #   port        = 15672
    #   target_port = 15672
    # }
  }
}
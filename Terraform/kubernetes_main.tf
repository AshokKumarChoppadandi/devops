terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.8.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "hello-world" {
  metadata {
    name = "hello-world"
    labels = {
      app = "HelloWorldApp"
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        run = "load-balancer-example"
      }
    }
    template {
      metadata {
        labels = {
          app = "HelloWorldApp"
          run = "load-balancer-example"
        }
      }
      spec {
        container {
          name = "hello-world"
          image = "gcr.io/google-samples/node-hello:1.0"
          port {
            container_port = 8080
            protocol = "TCP"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "hello-world-service" {
  metadata {
    name = "hello-world-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.hello-world.metadata.0.labels.app
    }
    type = "LoadBalancer"
    port {
      port = 8080
      target_port = "8080"
      protocol = "TCP"
    }
  }
}

resource "kubernetes_service" "hello-external-service" {
  metadata {
    name = "hello-external-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.hello-world.metadata.0.labels.app
    }
    type = "NodePort"
    port {
      port = 8080
      target_port = "8080"
      node_port = 30010
    }
  }
}

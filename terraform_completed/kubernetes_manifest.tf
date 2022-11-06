resource "kubernetes_manifest" "myapp_namespace" {
  manifest = yamldecode(var.yaml_location.namespace)
}

resource "kubernetes_manifest" "myapp" {
  manifest = yamldecode(var.yaml_location.app)
  depends_on = [kubernetes_manifest.myapp_namespace]
}

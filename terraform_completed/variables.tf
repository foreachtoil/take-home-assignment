variable "app_name" {
  type = string
  default = "myapp"
}

variable "deployment_replicas" {
  type = number
  default = 1
}

variable "deployment_image" {
  type = string
  default = "foreachtoil/sample-go-app:1.0.0"
}

variable "yaml_location" {
  default = {
    app = "../kubernetes/app.yaml"
    namespace = "../kubernetes/namespace.yaml"
  }
  type = object({
    app = string
    namespace = string
  })
}
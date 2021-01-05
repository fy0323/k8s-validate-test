package main

deprecated_deployment_version = [
  "extensions/v1beta1",
  "apps/v1beta1",
  "apps/v1beta2"
]

warn[msg] {
  input.kind == "Deployment"
  input.apiVersion == deprecated_deployment_version[i]
  msg = "set the latest APIVersion apps/v1"
}

deny[msg] {
  input.kind == "Deployment"
  input.spec.template.spec.containers[_].securityContext.privileged == true
  msg = "privileged is not allowed"
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "chainlink" {
  # Wasn't able to pull this from vulcanlink, trying local 
  name       = "chainlink"
  chart      = "../../helm/updated-charts/chainlink"
  namespace  = "default"

  set {
    name  = "replicaCount"
    value = "2"
  }
}

resource "helm_release" "ethereum" {
  name       = "ethereum"
  chart      = "../../helm/updated-charts/geth"
  namespace  = "default"

  set {
    name  = "replicaCount"
    value = "2"
  }

    set {
      name  = "nameOverride"
      value = "geth"
  }
}

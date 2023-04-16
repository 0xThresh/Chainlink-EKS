provider "helm" {
  kubernetes {
    config_path = "/home/james/.kube/config"
  }
}

resource "helm_release" "chainlink" {
  # Wasn't able to pull this from vulcanlink, trying local 
  name       = "chainlink"
  chart      = "../../helm/charts/chainlink"
  namespace  = "default"

  set {
    name  = "replicaCount"
    value = "2"
  }
}

resource "helm_release" "ethereum" {
  name       = "ethereum"
  chart      = "vulcanlink/geth"
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

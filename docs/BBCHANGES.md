Added at the bottom of the values file are changes to support Istio, monitoring, and optional network policies.

```yaml
domain: bigbang.dev

OpenShift:
  enabled: false
istio:
  enabled: false

monitoring:
  enabled: false

networkPolicies:
  enabled: false
  ingressLabels: 
    app: istio-ingressgateway
    istio: ingressgateway
  controlPlaneCidr: 0.0.0.0/0
  egressHttps:
    enabled: true
```

Incremented replicas to establish a minimal High-Availability deployment w/ podAntiAffinity to ensure pods are scheduled to different nodes

```yaml
replicas: 2

affinity:
  podAntiAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
    - labelSelector:
        matchExpressions:
        - key: app
          operator: In
          values:
          - metrics-server
      topologyKey: "kubernetes.io/hostname"
```

Network policies have been added under [chart/templates/bigbang/networkpolicies](../chart/templates/bigbang/networkpolicies/)
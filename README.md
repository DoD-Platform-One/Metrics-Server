# metrics-server

![Version: 3.9.0-bb.1](https://img.shields.io/badge/Version-3.9.0--bb.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.6.3](https://img.shields.io/badge/AppVersion-v0.6.3-informational?style=flat-square)

Metrics Server is a scalable, efficient source of container resource metrics for Kubernetes built-in autoscaling pipelines.

## Upstream References
* <https://github.com/kubernetes-sigs/metrics-server>

* <https://github.com/kubernetes-sigs/metrics-server>

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

* Clone down the repository
* cd into directory
```bash
helm install metrics-server chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.repository | string | `"registry1.dso.mil/ironbank/opensource/kubernetes-sigs/metrics-server"` |  |
| image.tag | string | `"v0.6.3"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets[0].name | string | `"private-registry"` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| serviceAccount.secrets | list | `[]` |  |
| rbac.create | bool | `true` |  |
| rbac.pspEnabled | bool | `false` |  |
| apiService.create | bool | `true` |  |
| apiService.annotations | object | `{}` |  |
| apiService.insecureSkipTLSVerify | bool | `true` |  |
| apiService.caBundle | string | `""` |  |
| commonLabels | object | `{}` |  |
| podLabels | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| priorityClassName | string | `"system-cluster-critical"` |  |
| containerPort | int | `4443` |  |
| hostNetwork.enabled | bool | `false` |  |
| replicas | int | `2` |  |
| updateStrategy | object | `{}` |  |
| podDisruptionBudget.enabled | bool | `false` |  |
| podDisruptionBudget.minAvailable | string | `nil` |  |
| podDisruptionBudget.maxUnavailable | string | `nil` |  |
| defaultArgs[0] | string | `"--cert-dir=/tmp"` |  |
| defaultArgs[1] | string | `"--kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname"` |  |
| defaultArgs[2] | string | `"--kubelet-use-node-status-port"` |  |
| defaultArgs[3] | string | `"--metric-resolution=15s"` |  |
| args | list | `[]` |  |
| livenessProbe.httpGet.path | string | `"/livez"` |  |
| livenessProbe.httpGet.port | string | `"https"` |  |
| livenessProbe.httpGet.scheme | string | `"HTTPS"` |  |
| livenessProbe.initialDelaySeconds | int | `0` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| readinessProbe.httpGet.path | string | `"/readyz"` |  |
| readinessProbe.httpGet.port | string | `"https"` |  |
| readinessProbe.httpGet.scheme | string | `"HTTPS"` |  |
| readinessProbe.initialDelaySeconds | int | `20` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `443` |  |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| addonResizer.enabled | bool | `false` |  |
| addonResizer.image.repository | string | `"registry.k8s.io/autoscaling/addon-resizer"` |  |
| addonResizer.image.tag | string | `"1.8.18"` |  |
| addonResizer.resources.limits.cpu | string | `"40m"` |  |
| addonResizer.resources.limits.memory | string | `"25Mi"` |  |
| addonResizer.resources.requests.cpu | string | `"40m"` |  |
| addonResizer.resources.requests.memory | string | `"25Mi"` |  |
| addonResizer.nanny.cpu | string | `"20m"` |  |
| addonResizer.nanny.extraCpu | string | `"1m"` |  |
| addonResizer.nanny.extraMemory | string | `"2Mi"` |  |
| addonResizer.nanny.memory | string | `"15Mi"` |  |
| addonResizer.nanny.minClusterSize | int | `10` |  |
| addonResizer.nanny.pollPeriod | int | `300000` |  |
| addonResizer.nanny.threshold | int | `5` |  |
| metrics.enabled | bool | `false` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.additionalLabels | object | `{}` |  |
| serviceMonitor.interval | string | `"1m"` |  |
| serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| serviceMonitor.metricRelabelings | list | `[]` |  |
| serviceMonitor.relabelings | list | `[]` |  |
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"200Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"200Mi"` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].key | string | `"app"` |  |
| affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].values[0] | string | `"metrics-server"` |  |
| affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].topologyKey | string | `"kubernetes.io/hostname"` |  |
| domain | string | `"bigbang.dev"` |  |
| openshift.enabled | bool | `false` |  |
| istio.enabled | bool | `false` |  |
| istio.mtls.mode | string | `"STRICT"` | STRICT = Allow only mutual TLS traffic, PERMISSIVE = Allow both plain text and mutual TLS traffic |
| monitoring.enabled | bool | `false` |  |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| networkPolicies.nodeCidr | string | `nil` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/ironbank/opensource/kubernetes/kubectl:v1.26.4"` |  |
| bbtests.imagePullSecret | string | `"private-registry"` |  |
| topologySpreadConstraints | list | `[]` |  |
| deploymentAnnotations | object | `{}` |  |
| schedulerName | string | `""` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

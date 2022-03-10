# metrics-server

![Version: 3.8.0-bb.0](https://img.shields.io/badge/Version-3.8.0--bb.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.0](https://img.shields.io/badge/AppVersion-0.6.0-informational?style=flat-square)

Metrics Server is a scalable, efficient source of container resource metrics for Kubernetes built-in autoscaling pipelines.

## Upstream References
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
| image.repository | string | `"k8s.gcr.io/metrics-server/metrics-server"` |  |
| image.tag | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| rbac.create | bool | `true` |  |
| rbac.pspEnabled | bool | `false` |  |
| apiService.create | bool | `true` |  |
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
| replicas | int | `1` |  |
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
| metrics.enabled | bool | `false` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.additionalLabels | object | `{}` |  |
| serviceMonitor.interval | string | `"1m"` |  |
| serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| resources | object | `{}` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

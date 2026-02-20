<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# metrics-server

![Version: 3.13.0-bb.5](https://img.shields.io/badge/Version-3.13.0--bb.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.8.1](https://img.shields.io/badge/AppVersion-0.8.1-informational?style=flat-square) ![Maintenance Track: bb_integrated](https://img.shields.io/badge/Maintenance_Track-bb_integrated-green?style=flat-square)

Metrics Server is a scalable, efficient source of container resource metrics for Kubernetes built-in autoscaling pipelines.

## Upstream References

- <https://github.com/kubernetes-sigs/metrics-server>
- <https://github.com/kubernetes-sigs/metrics-server>

## Upstream Release Notes

- [Find our upstream chart's CHANGELOG here](https://github.com/kubernetes-sigs/metrics-server/blob/master/charts/metrics-server/CHANGELOG.md)
- [and our upstream application release notes here](https://github.com/kubernetes-sigs/metrics-server/releases)

## Learn More

- [Application Overview](docs/overview.md)
- [Other Documentation](docs/)

## Pre-Requisites

- Kubernetes Cluster deployed
- Kubernetes config installed in `~/.kube/config`
- Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

- Clone down the repository
- cd into directory

```bash
helm install metrics-server chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| upstream.domain | string | `"bigbang.dev"` |  |
| upstream.image.repository | string | `"registry1.dso.mil/ironbank/opensource/kubernetes-sigs/metrics-server"` |  |
| upstream.image.tag | string | `"v0.8.1"` |  |
| upstream.image.pullPolicy | string | `"IfNotPresent"` |  |
| upstream.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.nameOverride | string | `"metrics-server"` |  |
| upstream.serviceAccount.automountServiceAccountToken | bool | `false` |  |
| upstream.podSecurityContext.runAsNonRoot | bool | `true` |  |
| upstream.podSecurityContext.runAsUser | int | `1000` |  |
| upstream.podSecurityContext.runAsGroup | int | `1000` |  |
| upstream.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| upstream.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| upstream.securityContext.runAsNonRoot | bool | `true` |  |
| upstream.securityContext.runAsUser | int | `1000` |  |
| upstream.securityContext.runAsGroup | int | `1000` |  |
| upstream.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| upstream.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| upstream.replicas | int | `2` |  |
| upstream.resources.limits.cpu | string | `"100m"` |  |
| upstream.resources.limits.memory | string | `"200Mi"` |  |
| upstream.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].key | string | `"app"` |  |
| upstream.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| upstream.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].values[0] | string | `"metrics-server"` |  |
| upstream.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].topologyKey | string | `"kubernetes.io/hostname"` |  |
| istio.enabled | bool | `false` |  |
| istio.hardened.enabled | bool | `false` |  |
| istio.hardened.customAuthorizationPolicies | list | `[]` |  |
| istio.hardened.outboundTrafficPolicyMode | string | `"REGISTRY_ONLY"` |  |
| istio.hardened.customServiceEntries | list | `[]` |  |
| istio.hardened.tempo.enabled | bool | `false` |  |
| istio.hardened.tempo.namespaces[0] | string | `"tempo"` |  |
| istio.hardened.tempo.principals[0] | string | `"cluster.local/ns/tempo/sa/tempo-tempo"` |  |
| istio.mtls.mode | string | `"STRICT"` | STRICT = Allow only mutual TLS traffic, PERMISSIVE = Allow both plain text and mutual TLS traffic |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| networkPolicies.nodeCidr | string | `nil` |  |
| networkPolicies.vpcCidr | string | `"0.0.0.0/0"` |  |
| networkPolicies.additionalPolicies | list | `[]` |  |
| networkPolicies.openShift.enabled | bool | `false` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.imagePullSecret | string | `"private-registry"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._


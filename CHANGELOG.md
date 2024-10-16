# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [3.12.2-bb.1] - 2024-10-15

### Added
- added upstreamReleaseNotesMarkdown to chart annotations

## [3.12.2-bb.0] - 2024-09-25

### Upgraded
- Update metrics-server `v0.7.1` -> `v0.7.2`
- Update addOnResizer `1.8.20` -> `1.8.21`
- Update kubectl `v1.29.3` -> `v1.29.8`
- Update gluon `0.4.9` -> `0.5.4`
- Chart updated `3.12.1-bb.6` -> `3.12.2-bb.0`

## [3.12.1-bb.6] - 2024-09-24

### Fixed

- Fixed issue with changes due to upstream drift

## [3.12.1-bb.5] - 2024-09-17

### Changed

- Fixed chart template drift from upstream

## [3.12.1-bb.4] - 2024-08-15

### Changed

- Run podLabels through tpl to interpret template expressions

## [3.12.1-bb.3] - 2024-07-03

### Removed

- Removed shared authPolicies set at the Istio level

## [3.12.1-bb.2] - 2024-06-10

### Added

- Check for upstream drift
- Add Kubernetes version conditional to values.rbac.pspenabled

## [3.12.1-bb.1] - 2024-04-24

### Added

- Custom network policies

## [3.12.1-bb.0] - 2024-04-15

### Added

- Update metrics-server v0.7.0 -> v0.7.1
- Update kubectl v1.28.7 -> v1.29.3
- Update gluon 0.4.8 -> 0.4.9

## [3.12.0-bb.1] - 2024-03-11

### Added

- Added istio Sidecar and ServiceEntry resources

## [3.12.0-bb.0] - 2024-02-23

### Added

- Update metrics-server v0.6.4 -> v0.7.0
- Update kubectl v1.28.4 -> v1.28.7

## [3.11.0-bb.3] - 2024-02-14

### Added

- Add `helmv3` to package managers and upgrade Gluon from 0.3.2 -> 0.4.8

## [3.11.0-bb.2] - 2023-12-15

### Added

- Add support for AuthorizationPolicies to harden Istio with `istio.harden.enabled: true`

## [3.11.0-bb.1] - 2023-11-30

### Added

- Update patch registry.k8s.io/autoscaling/addon-resizer from 1.8.19 -> 1.8.20

## [3.11.0-bb.0] - 2023-11-28

### Added

- Update patch version of metrics-server from v0.6.3 -> v0.6.4
- Update patch version of kubectl v1.28.3 -> v1.28.4

## [3.10.0-bb.3] - 2023-10-30

### Added

- Harden ServiceAccount with `automountServiceAccountToken: false` (overriden at Pod spec-level due to app requirements)
- Update patch version of kubectl v1.28.2 -> v1.28.3

## [3.10.0-bb.2] - 2023-09-29

### Added

- Update patch version of kubectl v1.27.6 -> v1.28.2

## [3.10.0-bb.1] - 2023-09-20

### Added

- Update patch version of kubectl v1.27.3 -> v1.27.6
- Update patch version of addon-resizer 1.8.18 -> 1.8.19
- Update securityContext to include runAsGroup

## [3.10.0-bb.0]

### Added

- Update patch version of kubectl v1.26.4 -> v1.27.3
- Updated helm chart version and upstream changes.

## [3.9.0-bb.1]

### Added

- Update patch version of addon-resizer v1.8.14 -> 1.8.18
- Update patch version of kubectl v1.26.3 -> 1.26.4

## [3.9.0-bb.0]

### Added

- Updated helm chart version and upstream changes.
- Upgrade metrics server image 0.6.2 -> 0.6.3
- Update patch version of kubectl v1.26.2 -> 1.26.3

## [3.8.4-bb.0]

### Added

- Updated helm chart version. Upstream changes do not apply.

## [3.8.3-bb.2]

### Added

- Updated kubectl image to v1.26.1

## [3.8.3-bb.1]

### Added

- Updated kubectl image to v1.25.6

## [3.8.3-bb.0]

### Added

- Updated to upstream helm chart metrics-server-helm-chart-3.8.3
- Updated metrics-server images to 0.6.2
- Updated kubectl image to v1.25.5

## [3.8.0-bb.6]

### Added

- Updated kubectl image to v1.25.4

## [3.8.0-bb.5]

### Added

- Added bbtests structure and script tests

## [3.8.0-bb.4]

### Added

- Added default Istio `PeerAuthentication` for mTLS

## [3.8.0-bb.3]

### Added

- Added `renovate.json` to packge root for allowing renovate bot to create Issues/MR's for updates

## [3.8.0-bb.2]

### Changed

- Changed the values.yaml to use the Iron Bank metrics server image
- Added a test-values.yaml file for pipeline tests

## [3.8.0-bb.1]

### Added

- Added allow-svc-ingress.yaml for service-access

## [3.8.0-bb.0]

### Added

- Pointing to upstream helm chart 3.8.0

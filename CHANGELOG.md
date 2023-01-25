# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---
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

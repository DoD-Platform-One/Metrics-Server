### Steps for KPT update
1. Navigate to the upstream chart repo and folder [here](https://github.com/kubernetes-sigs/metrics-server/tree/master/charts/metrics-server) and find the tag that corresponds with the new chart version for this update
2. Checkout the `renovate/ironbank` branch
3. From the root of the repo run `kpt pkg update chart@<tag> --strategy alpha-git-patch`, where tag is found in step 1, checkout the `chart/Kptfile` ref for tag naming
4. Modify the version in `Chart.yaml` and append `-bb.0` to the chart version from upstream. Update dependencies to latest BB gluon library version using: `helm dependency update ./chart`
5. Update dependencies and binaries using `helm dependency update ./chart`

    - Pull assets and commit the binaries as well as the Chart.lock file that was generated.
      ```shell
      helm dependency update ./chart
      ```
6. Update `CHANGELOG.md` adding an entry for the new version and noting all changes (at minimum should include `Updated <chart or dependency> to x.x.x`).
7. Generate the `README.md` updates by following the [guide in gluon](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md).
8. Push up your changes, add upgrade notices if applicable, validate that CI passes. If there are any failures, follow the information in the pipeline to make the necessary updates. Add the `debug` label to the MR for more detailed information. Reach out to the CODEOWNERS if needed.

9. As part of your MR that modifies bigbang packages, you should modify the bigbang  [bigbang/tests/test-values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/tests/test-values.yaml?ref_type=heads) against your branch for the CI/CD MR testing by enabling your packages. 

    - To do this, at a minimum, you will need to follow the instructions at [bigbang/docs/developer/test-package-against-bb.md](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/developer/test-package-against-bb.md?ref_type=heads) with changes for Metrics Server enabled (the below is a reference, actual changes could be more depending on what changes where made to Metrics Server in the pakcage MR).

### [test-values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/tests/test-values.yaml?ref_type=heads)
    ```yaml
    metricsServer:
      enabled: true
      git:
        tag: null
        branch: <my-package-branch-that-needs-testing>
      values:
        istio:
          hardened:
            enabled: true
      ### Additional compononents of Metrics Server should be changed to reflect testing changes introduced in the package MR
    ```

10. Perform the steps below for manual testing

### Modifications made to upstream
> List of changes per file to be aware of for how Big Bang differs from upstream

## /chart/Chart.yaml
- Added `bigbang.dev/applicationVersions` annotation with the metrics server version
- Modified Version to include `-bb.x` suffix

## /chart/templates/bigbang/networkpolicies/*
- Network Policies added to establish allowed communication in/out of namespace
  - allow-dns-egress
  - allow-svc-ingress
  - default-deny-all
  - egress-istiod
  - ingress-monitoring
  - istio-allow
  - kube-api-allow
  - namespace-allow

## /chart/templates/bigbang/authorizationpolicies/*
- Authorization Policies added to establish allowed layer 7 communication to the metrics-server API.
  - allow-metrics-server
  - allow-nothing-policy
  - template
  - tempo-authz-policy

## chart/values.yaml
- Add common values for Big Bang packages for domain, networkpolicies and Istio
- Increase replicas to 2 for failover
- Add affinity rules to schedule pods to separate nodes
- Addition of `serviceAccount.automountServiceAccountToken` to allow API token automounting behavior to be configurable

## chart/templates/serviceaccount.yaml
- Addition of `serviceAccount.automountServiceAccountToken` to allow API token automounting behavior to be configurable

## chart/templates/deployment.yaml
- Overrides `automountServiceAccountToken` hardening at the Pod spec-level due to app requirements
- Upstream chart has L26-30 written:
```
 labels:
        {{- include "metrics-server.selectorLabels" . | nindent 8 }}
      {{- with .Values.podLabels }}
        {{- toYaml . | nindent 8 }}
      {{- end }}
```
However, in Big Bang clusters this fails regex validation, and thus should be kept as:
```
 labels:
        {{- include "metrics-server.selectorLabels" . | nindent 8 }}
      {{- with .Values.podLabels }}
        {{- tpl (toYaml .) $ | nindent 8 }}
      {{- end }}
```

## chart/Kptfile
- Tracks current upstream chart

### Manual Testing
> NOTE: For these testing steps it is good to do them on both a clean install and an upgrade. For clean install, point `metrics-server` to your branch. For an upgrade do an install with `metrics-server` pointing to the latest tag, then perform a helm upgrade with `metrics-server` pointing to your branch.

- Deployment of Big Bang with Istio, Monitoring, Network Policies, Authorization Policies, and metrics server enabled will allow the use of `kubectl top nodes` and `kubectl top pods -A` to report utilization.

`overrides/metrics-server.yaml`
```yaml
addons:
  metricsServer:
    enabled: true
    sourceType: "git"
    git:
      tag: null
      branch: "renovate/ironbank"
```

When in doubt with any testing or upgrade steps, reach out to the CODEOWNERS for assistance.

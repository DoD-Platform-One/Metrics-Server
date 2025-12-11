# Metrics Service Development and Maintenance Guide

## To Upgrade the Metrics Server Package
NOTE: Metrics Server Renovate updates differ from most other BigBang Renovate updates because Metrics Server uses a wrapper chart, rather than a fork of the upstream chart.

1. Navigate to the upstream [chart repo and folder](https://github.com/kubernetes-sigs/metrics-server/tree/master/charts/metrics-server) and find the appropriate tag that corresponds with the latest chart version for this update. The tag should follow this format: `metrics-server-helm-chart-x.x.x`.
  - Review the [upstream release-notes](https://github.com/kubernetes-sigs/metrics-server/releases) for important changes and upgrade notices.

2. `git clone` the Metrics Server repository from Repo1 and checkout the `renovate/ironbank` branch.


3. Modify the chart version in `./chart/Chart.yaml` and append `-bb.0` (if missing or incorrect) to the chart version from upstream.

4. Ensure the BB `./chart/Chart.yaml` and the target upstream version `Chart.yaml` align correctly with the following:
  - Check `appVersion` and `bigbang.dev/applicationVersions` in `./chart/Chart.yaml` to make sure they match and have updated to the correct version
  - Check the upstream chart `dependencies` and compare the dependency versions against the corresponding image tags in `./chart/values.yaml` to make sure they match

**NOTICE:** The upgrade issue may be blocked under one or more of the following conditions:
  - You are trying to upgrade to a new image or image tag that does not yet exist in Ironbank.
    - To remediate; Ensure that an Ironbank issue exists that is tracking this upgrade or request. Link the Ironbank issue to your upgrade issue for tracking purposes.
  - You are trying to upgrade to a newer image tag in Ironbank, but is not yet supported or tested by upstream.
    - To remediate; Consider opening your own MR to upgrade upstream if the maintainers have not done so in a timely manner.

5. Update the image tags in BB `./chart/values.yaml` to match the target upstream version with their Ironbank equivalent for the following:
  - `upstream.image.tag`

6. Update the `./chart/Chart.yaml` annotations `helm.sh/images` to match the updated tags from previous step.

7. Update dependencies and binaries using `helm dependency update ./chart`.

  - If needed, log into registry1.

    ```shell
    # Note, if you are using Ubuntu on WSL and get an error about storing credentials or about how `The name org.freedesktop.secrets was not
    # provided by any .service files` when you run the command below, install the libsecret-1-dev and gnome-keyring packages. After doing this,
    # you'll be prompted to set a keyring password the first time you run this command.
    #
    helm registry login https://registry1.dso.mil -u ${registry1.username}
    ```

  - Pull assets and commit the binaries as well as the Chart.lock file that was generated.

    ```shell
    # Note: You may need to resolve merge conflicts in chart/values.yaml before these commands work. Refer to the "Modifications made to upstream"
    # section below for hints on how to resolve them. Also, you need to be logged in to registry1 thorough docker.
    helm dependency update ./chart
    ```

    Then log out.

    ```shell
    helm registry logout https://registry1.dso.mil
    ```

8. Update `./CHANGELOG.md` adding an entry for the new version and noting all changes in a list (at minimum should include `- Updated <chart or dependency> to x.x.x`).

9. Generate the `./README.md` updates by following the [guide in gluon](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md).

10. Commit and push up your changes, add upgrade notices to the MR if applicable, validate that CI passes.
  - If there are any failures, follow the information in the pipeline to make the necessary updates.
  - Add the `debug` label to the MR for more detailed information.
  - Reach out to the CODEOWNERS if needed.

11. As part of your MR that modifies bigbang packages, you should modify the bigbang [bigbang/tests/test-values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/tests/test-values.yaml?ref_type=heads) against your branch for the CI/CD MR testing by enabling your packages.
  - To do this, at a minimum, you will need to follow the instructions at [bigbang/docs/developer/test-package-against-bb.md](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/developer/test-package-against-bb.md?ref_type=heads) with changes for Metrics Server enabled (the below is a reference, actual changes could be more depending on what changes where made to Metrics Server in the package MR).

### [test-values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/tests/test-values.yaml?ref_type=heads)
    ```yaml
    addons:
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

9. Perform the steps below for manual testing

### Modifications made to upstream
Section not applicable as Metrics Server was implemented as a wrapper chart, changes to ./chart/values.yaml should not be lost when upgrading.

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

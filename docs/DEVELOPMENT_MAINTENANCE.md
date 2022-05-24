# How to upgrade the Metrics Server Package chart

This chart is reconciled against the [upstream chart](https://github.com/kubernetes-sigs/metrics-server/tree/master/charts/metrics-server) as declared in the [Kptfile](../chart/Kptfile).

When an upgrade is required, `kpt` can be ran to pull the updates with a targeted tag.

(from the repository root)
`kpt pkg update chart@<new tag> --strategy alpha-git-patch`

Once completed, you will need to reconcile the modifications that Big Bang makes back into the orchestration.

# Modfiications Made to the upstream chart

## /chart/Chart.yaml
- Added `bigbang.dev/applicationVersions` annotation with the metrics server version
- Modified Version to include `-bb.x` suffix

## /chart/bigbang/networkpolicies/*
- Network Policies added to establish allowed communication in/out of namespace

## chart/values.yaml
- Add common values for Big Bang packages for domain, networkpolicies and Istio
- Increase replicas to 2 for failover
- Add affinity rules to schedule pods to separate nodes

## chart/Kptfile
- Tracks current upstream chart

# Testing a new Metrics Server version

Current testing is done manually. Deployment of Big Bang with Istio, Monitoring, Network Policies and metrics server enabled will allow the use of `kubectl top nodes` and `kubectl top pods -A` to report utilization.  
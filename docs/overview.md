# Metric Server

## Overview

This package contains an installation of Metric Server using a helm chart sourced from [upstream](https://github.com/kubernetes-sigs/metrics-server/tree/master/charts/metrics-server) with minimal modifications.

## Metric Server

[Metric Server](https://repo1.dso.mil/big-bang/product/packages/metrics-server) is an addon cluster utility that adds functionality to Kubernetes clusters rather than applications. It is used for monitoring pod CPU & memory utilization for use with autoscaling pods horizontally and vertically.

This repo provides an implementation of Metric Server for Big Bang. The default deployment consists of 2 replicas for high availability.

## How it works

[Metric Server](https://repo1.dso.mil/big-bang/product/packages/metrics-server) collects resource metrics from Kubelets and exposes them in Kubernetes apiserver through [Metrics API]
for use by [Horizontal Pod Autoscaler] and [Vertical Pod Autoscaler]. Metrics API can also be accessed by `kubectl top`,
making it easier to debug autoscaling pipelines.

Metric Server is not meant for non-autoscaling purposes. For example, don't use it to forward metrics to monitoring solutions, or as a source of monitoring solution metrics. In such cases please collect metrics from Kubelet `/metrics/resource` endpoint directly.

Users looking to access historical data should look into Prometheus and Grafana packages as part of BigBang's [monitoring stack](https://repo1.dso.mil/big-bang/product/packages/monitoring).

Please review the BigBang [Architecture Document](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/understanding-bigbang/package-architecture/metricserver.md) for more information about it's role within BigBang.
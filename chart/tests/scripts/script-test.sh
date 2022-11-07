#!/bin/bash
set -e

# below are a few health checks to determine basic functionality

echo "Checking for v1beta1.metrics.k8s.io apiservice to be AVAILABLE"
apiservice_response=$(kubectl get apiservice -l app.kubernetes.io/name=metrics-server -o jsonpath='{.items[0].status.conditions[?(@.type=="Available")]}' | grep '"status":"True"')
status=$?
echo "${apiservice_response}"
if [ ! ${status} -eq 0 ]; then
  echo "Test 1 Failure: kubectl apiservice v1beta1.metrics.k8s.io did not return status=True"
  echo "Debug information (apiservice_response):"
  echo "${apiservice_response}"
  exit 1
fi
echo "Test 1 Success: Kube ApiServer reporting v1beta1.metrics.k8s.io as status=True"

echo "Checking number of node entries > 0"
nodes_response=$(kubectl top nodes --no-headers)
node_records=$(kubectl top nodes --no-headers | wc -l)
echo "${nodes_response}"
if [ ! ${node_records} -gt 0 ]; then
  echo "Test 2 Failure: kubectl top nodes did not return > 0 entries"
  echo "Debug information (metrics response):"
  echo "${nodes_response}"
  exit 1
fi
echo "Test 2 Success: Metrics-Server has returned ${node_records} node records."
sleep 10

# there will likely never be less than 3 pods in the cluster
# this chart deploys 2, establishing some minimum threshold
echo "Checking number of pod entries > 2"
pods_response=$(kubectl top pods -A --no-headers)
pod_records=$(kubectl top pods -A --no-headers | wc -l)
echo "${pods_response}"
if [ ! ${pod_records} -gt 2 ]; then
  echo "Test 3 Failure: kubectl top pods did not return > 2 entries"
  echo "Debug information (metrics response):"
  echo "${pods_response}"
  exit 1
fi
echo "Test 3 Success: Metrics-Server has returned ${pod_records} pod records."
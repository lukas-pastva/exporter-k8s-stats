#!/bin/bash

echo "# This is Prometheus Exporter exporter-k8s-stats"

export METRIC_POD_COUNT=$(kubectl get pods -A | wc -l)
export METRIC_NS_COUNT=$(kubectl get ns | wc -l)

echo 'k8s_stats_pod_count{}' ${METRIC_POD_COUNT}
echo 'k8s_stats_ns_count{}' ${METRIC_NS_COUNT}
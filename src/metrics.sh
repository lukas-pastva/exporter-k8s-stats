#!/bin/bash

echo "# This is Prometheus Exporter exporter-k8s-stats"

export METRIC_POD_COUNT=$(kubectl get pods -A | wc -l)
echo 'k8s_stats_pod_count{}' ${METRIC_POD_COUNT}

export METRIC_NS_COUNT=$(kubectl get ns | wc -l)
echo 'k8s_stats_ns_count{}' ${METRIC_NS_COUNT}

export METRIC_CM_COUNT=$(kubectl get cm -A | wc -l)
echo 'k8s_stats_cm_count{}' ${METRIC_CM_COUNT}

export METRIC_SECRET_COUNT=$(kubectl get secret -A | wc -l)
echo 'k8s_stats_secret_count{}' ${METRIC_SECRET_COUNT}

export METRIC_CR_COUNT=$(kubectl get clusterrole | wc -l)
echo 'k8s_stats_cr_count{}' ${METRIC_CR_COUNT}

export METRIC_CRB_COUNT=$(kubectl get clusterrolebinding | wc -l)
echo 'k8s_stats_crb_count{}' ${METRIC_CRB_COUNT}

export METRIC_SA_COUNT=$(kubectl get sa -A | wc -l)
echo 'k8s_stats_sa_count{}' ${METRIC_SA_COUNT}
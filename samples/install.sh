#!/bin/bash

kubectl create ns bookinfo
kubectl label namespace bookinfo istio-injection=enabled
kubectl apply -f bookinfo/networking/bookinfo-gateway.yaml -n bookinfo
kubectl apply -f bookinfo/platform/kube/bookinfo.yaml -n bookinfo
sed 's/example/bookinfo/g' ../ingress.yml | sed "s/domain/zhouxin.vip/g" | kubectl --namespace istio-system apply -f -
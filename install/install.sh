#!/bin/bash

kubectl create ns weather
kubectl label namespace weather istio-injection=enabled
kubectl apply -f weather-v1.yaml -n weather
kubectl apply -f weather-gateway.yaml -n weather
sed 's/example/weather/g' ../ingress.yml | sed "s/domain/zhouxin.vip/g" | kubectl --namespace istio-system apply -f -
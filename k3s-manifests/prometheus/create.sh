#!/bin/bash
kubectl create namespace monitoring
kubectl create -f ./nfs-pv.yml
kubectl create -f ./nfs-pvc.yml
kubectl create -f ./prometheus-deployment.yml
kubectl create -f ./prometheus-service.yml
kubectl create -f ./prometheus-ingress.yml

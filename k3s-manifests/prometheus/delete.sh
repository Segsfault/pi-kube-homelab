#!/bin/bash
kubectl delete -f ./prometheus-ingress.yml
kubectl delete -f ./prometheus-service.yml
kubectl delete -f ./prometheus-deployment.yml
#kubectl delete -f ./nfs-pvc.yml
#kubectl delete -f ./nfs-pv.yml
kubectl delete namespace monitoring
#needed for removing the pvc
#kubectl patch pvc nfs-pvc -p '{"metadata":{"finalizers": []}}' --type=merge
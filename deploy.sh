

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=cygnetops/multi-server:$SHA
kubectl set image deployments/client-deployment client=cygnetops/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=cygnetops/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=stephengrider/multi-server:$SHA
kubectl set image deployments/client-deployment server=stephengrider/multi-client:$SHA
kubectl set image deployments/worker-deployment server=stephengrider/multi-worker:$SHA
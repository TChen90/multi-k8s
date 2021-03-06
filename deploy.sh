docker build -t tchen90pro/multi-client:latest -t tchen90pro/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t tchen90pro/multi-server:latest -t tchen90pro/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t tchen90pro/multi-worker:latest -t tchen90pro/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push tchen90pro/multi-client:latest
docker push tchen90pro/multi-server:latest
docker push tchen90pro/multi-worker:latest

docker push tchen90pro/multi-client:$SHA
docker push tchen90pro/multi-server:$SHA
docker push tchen90pro/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=tchen90pro/multi-server:$SHA
kubectl set image deployments/client-deployment client=tchen90pro/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=tchen90pro/multi-worker:$SHA
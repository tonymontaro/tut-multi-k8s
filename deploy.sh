docker build -f client/Dockerfile -t tonymontaro/tut-multi-docker-client:latest -t tonymontaro/tut-multi-docker-client:$GIT_SHA ./client
docker build -f server/Dockerfile -t tonymontaro/tut-multi-docker-server:latest -t tonymontaro/tut-multi-docker-server:$GIT_SHA ./server
docker build -f worker/Dockerfile -t tonymontaro/tut-multi-docker-worker:latest -t tonymontaro/tut-multi-docker-worker:$GIT_SHA ./worker

docker push tonymontaro/tut-multi-docker-client:latest
docker push tonymontaro/tut-multi-docker-server:latest
docker push tonymontaro/tut-multi-docker-worker:latest

docker push tonymontaro/tut-multi-docker-client:$GIT_SHA
docker push tonymontaro/tut-multi-docker-server:$GIT_SHA
docker push tonymontaro/tut-multi-docker-worker:$GIT_SHA

kubectl apply -f k8s/
kubectl set image deployments/client-deployment client=tonymontaro/tut-multi-docker-client:$GIT_SHA
kubectl set image deployments/server-deployment server=tonymontaro/tut-multi-docker-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=tonymontaro/tut-multi-docker-worker:$GIT_SHA

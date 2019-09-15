# Set docker image
kubectl set image deployment/client-deployment client=tonymontaro/tut-multi-docker-client:v5

# Get
kubectl get deployments
kubectl get pods
kubectl get services

# Apply config
kubectl apply -f client-deployment.yaml
  # apply a group in folder
kubectl apply -f k8s/

# connect to docker-server in kubernetes node
eval $(minikube docker-env)

# delete deployment
kubectl delete deployment client-deployment
kubectl delete service client-node-port

# create secret
kubectl create secret generic <secret_name> --from-literal key=value

kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345
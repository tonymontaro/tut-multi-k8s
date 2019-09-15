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


# use docker to install travis-cli
docker run -it -v $(pwd):/app ruby:2.3 sh
gem install travis
travis login
travis encrypt-file service-account.json -r tonymontaro/tut-multi-k8s


# config Helm and Tiller (package manager for k8s)
curl -LO https://git.io/get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller --upgrade

# Using Helm for installing Ingress Nginx
https://kubernetes.github.io/ingress-nginx/deploy/#using-helm
helm install stable/nginx-ingress --name my-nginx --set rbac.create=true

# delete install with Helm
helm del --purge my-nginx



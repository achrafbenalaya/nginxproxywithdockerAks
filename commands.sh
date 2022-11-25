# make sure terraform CLI is installed
terraform

# format the tf files
terraform fmt

# initialize terraform Azure modules
terraform init

# validate the template
terraform validate

# plan and save the infra changes into tfplan file
terraform plan -out tfplan

# show the tfplan file
terraform show -json tfplan
terraform show -json tfplan >> tfplan.json

# Format tfplan.json file
terraform show -json tfplan | jq '.' > tfplan.json

# show only the changes
cat tfplan.json | jq -r '(.resource_changes[] | [.change.actions[], .type, .change.after.name]) | @tsv'
cat tfplan.json | jq '[.resource_changes[] | {type: .type, name: .change.after.name, actions: .change.actions[]}]' 

# apply the infra changes
terraform apply tfplan

# delete the infra
terraform destroy

# cleanup files
rm terraform.tfstate
rm terraform.tfstate.backup
rm .terraform.lock.hcl
rm tfplan
rm tfplan.json
rm -r .terraform/

------------------------aks-------------------

kubectl apply -f ./my-namespace.yaml
kubectl config set-context --current --namespace=ingress

kubectl get services --namespace ingress

kubectl apply -f 01-backend-deployment.yml -f 02-backend-clusterip-service.yml
kubectl apply -f 03-frontend-deployment.yml -f 04-frontend-LoadBalancer-service.yml 

kubectl apply -f 01-nginx-frontend.yml
kubectl apply -f app-ingress.yml

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update


helm install app-ingress ingress-nginx/ingress-nginx `
     --namespace ingress `
     --create-namespace `
     --set controller.replicaCount=1 `
     --set controller.nodeSelector."kubernetes\.io/os"=linux `
     --set defaultBackend.nodeSelector."kubernetes\.io/os"=linux


#ssl

kubectl create secret tls ingressdemo --namespace cert-manager  --key private.key  --cert certificate.crt

kubectl describe secret ingressdemo --namespace cert-manager 
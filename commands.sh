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

kubectl create -f ./my-namespace.yaml
kubectl config set-context --current --namespace=hellonginxdotnet
kubectl apply -f 01-backend-deployment.yml -f 02-backend-clusterip-service.yml
kubectl apply -f 03-frontend-deployment.yml -f 04-frontend-LoadBalancer-service.yml 

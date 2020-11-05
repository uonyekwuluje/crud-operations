## Environment Variables
```
export GOOGLE_PROJECT="<Google Project Name>"
export ENVIRONMENT_PREFFIX="<Environment Prefix>"
export SSH_USER="<ssh username>"
```

## Terraform Init
```
terraform init
```
## Terraform Plan
```
terraform plan -var="var_project=${GOOGLE_PROJECT}" -var="env_preffix=${ENVIRONMENT_PREFFIX}" -var="username=${SSH_USER}"
```
## Terraform Approve
```
terraform apply -auto-approve -var="var_project=${GOOGLE_PROJECT}" -var="env_preffix=${ENVIRONMENT_PREFFIX}" -var="username=${SSH_USER}"
```

## Terraform Destroy
```
terraform destroy -auto-approve -var="var_project=${GOOGLE_PROJECT}" -var="env_preffix=${ENVIRONMENT_PREFFIX}" -var="username=${SSH_USER}"
```

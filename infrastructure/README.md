## Environment Variables
```
export GOOGLE_PROJECT="<Google Project Name>"
export ENVIRONMENT_PREFFIX="<Environment Prefix>"
```

## Terraform Init
```
terraform init
```
## Terraform Plan
```
terraform plan -var="var_project=${GOOGLE_PROJECT}" -var="env_preffix=${ENVIRONMENT_PREFFIX}"
```
## Terraform Approve
```
terraform apply -auto-approve -var="var_project=${GOOGLE_PROJECT}" -var="env_preffix=${ENVIRONMENT_PREFFIX}"
```

## Terraform Destroy
```
terraform destroy -auto-approve -var="var_project=${GOOGLE_PROJECT}" -var="env_preffix=${ENVIRONMENT_PREFFIX}"
```

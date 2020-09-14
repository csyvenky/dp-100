# dp-100
Terraform IaC for the MS DP-100 exam preparation and studying.

## Notes
- n/a

Issue Tracker: https://github.com/csyvenky/dp-100/issues

# Pre-requisites
- Active Azure Subscription
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) v.2.11.1
- [Terraform CLI](https://www.terraform.io/downloads.html) v.0.13.2

# Execution Steps
```
az login -u <your AAD credentials>
terraform init
terraform plan --var-file=env/<env>/variables.tfvars --var-file=secrets/secrets.tfvars -out="<env>.tfplan"
terraform apply "<env>.tfplan"
```

# Code Cleanup
```
terraform fmt; terraform fmt .\env\<env>\
```

# Destroy
```
terraform destroy --var-file=env/<env>/variables.tfvars --var-file=secrets/secrets.tfvars [-auto-approve]
```
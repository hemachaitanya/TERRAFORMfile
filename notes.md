* TERRAFORM: terraform is a hashicroplanguage to extands plugins


### Terraform  init: 
to create background information

Terraform validate: to check our data syntax will be correct or not

Terraform fmt: write the code  arrangement is in proper setting 

Terraform plan: what we want to create information will we gives its give plan of output

Terraform apply: its createsome state file and create some work space

Terraform apply -auto-approve: yes/no authentication not requaired

Terraform apply -var ./values.tf:  to take variables and values will be 
 attached we cannot change our templet we use variable file

Terraform plan -target=”resoure_type.resource_name”:  we want to create only one resource we use -target=resource_type&resourc_name

Assigning Values to Root Module Variables

When variables are declared in the root module of your configuration, they can be set in a number of ways:

Individually, with the -var command line option.

In variable definitions (.tfvars) files, either specified on the command line or automatically loaded.

As environment variables.

terraform apply -var "region=ap-south-2" -var "ntier-vpc-range=10.10.0.0/16"

terraform apply -var-file values.tfvars

Terraform also automatically loads a number of variable definitions files if they are present: Files named exactly terraform.tfvars or terraform.tfvars.json. Any files with names ending in .auto.tfvars or .auto.tfvars.json.

  Create loadbalancer manually and import state file into terraform

Terraform import <resource_type>.<resource id>

Create more resources we apply only one resource 

Terraform apply/plan -target=”<resource_type>.<resource_name>” 

Create  two resources in two different folders by using modules(alias)

How to remove resources from state file

Terraform state rm <resourcetype>.<resourcename>

![images](./Images/1.png)

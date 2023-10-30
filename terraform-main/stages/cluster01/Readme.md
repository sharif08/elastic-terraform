
# Workflow 
* The preprod is used for development rancher kubernets cluster, each folder name defines cluster name example : test-cluster1, test-cluster1, .......
* Each foler consist of subfoler and files.

````
Structure:
cluster-name/
.............config/example.yaml
............main.tf
````

* The main.tf file is referencing to resource folder to execute the module resource of terraform
* The mian.tf consist of module resource path and variable values
* Run the terraform from main.tf location.


# Run Terraform
example
````
      - terraform init
      - terraform validate
      - terraform apply -auto-approve -var apikey="sasdas" -var file_path="asdasdas" -var kibana_url="" -var kibana_user="elastic" -var kibana_pass="1UvqDqsa"
````

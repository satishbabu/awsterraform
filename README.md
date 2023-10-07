# awsterraform
Learning Terraform on AWS

# Setup
Download Terraform and it is a single executable file.  Add it to the path variable so that it can be executed from anywhere.

Run the following from a command prompt.  Ensure it displays the version
```
terraform --version
```


# Install aws cli
Install aws cli and verify it from a command prompt
```
aws --version
```

# Configure aws and provide the details.  The config is stored in ~/.aws
```
aws configure
```

# Create the resource on cloud

Initialize the terraform
```
terraform init
```

Run the plan and check the out put to ensure it is creating/updating the required resouces
```
terraform plan
```

Run the apply to make the changes.  Go to AWS console and ensure the required resources were created
```
terraform apply
```

Run the destroy to make the changes.  Be careful this will delete all the resoruces. 
```
terraform destroy
```




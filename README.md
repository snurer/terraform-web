<img src="https://raw.githubusercontent.com/Saintmori/terraform/main/terraform.png" width="200" height="200">

# Terraform Web Project

## Creating AWS Resources (VPC - ASG - ALB ) with Terraform without Modules

This repository contains three different folders to create custom VPC with 3 private and 3 public Subnets, ALB-Application Load Balancer, and ASG-AutoScaling Group and there resources are attached to each other by data sourcing to each others' [backend](https://developer.hashicorp.com/terraform/language/settings/backends/configuration) files. 


| Template    | Description     |
| :--- | :--- | 
|[alb](https://github.com/snurer/terraform-web/tree/main/alb)    |TF templates that create target group and application load balancer with security group   |
|[asg](https://github.com/snurer/terraform-web/tree/main/asg)    |TF templates that create auto scaling group, launch template with security group     |
|[vpc](https://github.com/snurer/terraform-web/tree/main/vpc)     |TF templates that create vpc, subnets, route tables, internet gateway and nat gateway   |

## Terraform Apply

To create these resources and configure their attachments, you need to follow this order:
```
cd vpc
terraform init
terraform apply
```
Then after getting the outputs of VPC ID and Subnet ID's, go to ASG file:
```
cd asg
terraform init
terraform apply
```
Perfect! You successfully created Auto Scaling Group in your custom VPC. Now you will create your Load Balancer in the same VPC and attach to your ASG.
```
cd alb
terraform init
terraform apply
```

## Terraform Destroy

When you are destroying your resources, run ```terraform destroy``` to ALB, ASG and VPC respectively. If you destroy VPC first, you'll ruin the configuration of other services and will not be able to destroy them with Terraform.

***Note*** : There's a better way to configure all services being connected to each other, which is [Terraform Modules](https://developer.hashicorp.com/terraform/language/modules) . In this project, we used data sourcing to backend files. The codes are working perfectly however it would need a lot of complex configurations and when there are more services to manage. So you would definitely go and use **Modules**. However, it's nice to see and configure the Resources without modules to understand the background process better.

## Contribution

Thank you! Feel free to clone this repository and contribute!

Author: [snurer](https://github.com/snurer)

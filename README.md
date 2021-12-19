# IaC - LAMP in AWS

### Problem Statement

* Setup a LAMP Stack on a AWS Cloud.
* For Linux Operating System distribution assume Ubuntu.
* For the MySQL setup RDS on AWS.
* Use Python as programming language.
* Write Terraform scripts to create the infrastructre for the above stack.
* Use Ansible/Chef to provision the LAMP stack on the infrastructure.
* Create a Highly Available setup


### Assumptions

* A single t2.micro instance will be enough to support incoming traffic for the application
* TLS security certificates aren't required

### Modules Structure

* **vpc** - Network components module - vpc, subnets, Igw and route tables
* **db** - AWS RDS(MySQL) module
* **alb** - Application Load Balancer module 
* **web** - AutoScaling Group module for spinning up EC2 instances 

![alt text](https://github.com/TribalArtifactor/aws-lamp-iac/blob/main/AWS-Architecture.png?raw=true)

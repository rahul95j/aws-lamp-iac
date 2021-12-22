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

### Prerequisites 
* Terraform v1.1
* AWS account with admin privileges

### **AWS-Architecture**
![alt text](AWS-Architecture.png?raw=true)

### Modules Structure

* **vpc** - Network components module - vpc, subnets, Igw and route tables
* **db** - AWS RDS(MySQL) module
* **alb** - Application Load Balancer module 
* **web** - AutoScaling Group module for spinning up EC2 instances 

### Sample test LAMPy application

The apache server points to "/var/www/test/index.py" which is a custom python script(CGI script) that connects to the MySQL Database and adds the following values to the table:

(1, 'One!'),(2, 'Two!'),(3, 'Three!')

It then prints all contents of the database. Entries will be added everytime a HTTP request reaches the apache server. 

### Custom AMI

To reduce the lines of bootstrap code and improve boot time I created a custom AMI from the EC2 instance spun up by terraform. It contains the following modifications from standard ubuntu AMI:
* Libraries Installed
  * apache2
  * python3-pip
  * pymysql
* Disabled ufw

### **Terraform Output** 
(Click to Expand)
![alt text](terraform_graph.png?raw=true)

### Next Steps

* Improve security and reusability 
 * Use user inputted credentials for passing credentials
 * Deploy ASG in private subnet
 * Provide only required permissions to AWS services
* Create NAT gateway/instance and bastion host. 
* Use S3 to store tfstate file 
* Create ansible script to perform update
* Modify application to deploy WordPress site
* Add capability to utilize read replica/RDS standby in case of failures

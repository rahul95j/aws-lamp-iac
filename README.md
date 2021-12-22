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

![alt text](AWS-Architecture.png#gh-dark-mode-only)

### Sample test LAMPy application

The apache server points to "/var/www/test/index.py" which is a custom python script that connects to the MySQL Database and adds the following values to the table:
(1, 'One!'),(2, 'Two!'),(3, 'Three!')

It then prints all contents of the database. Entries will be added everytime a HTTP request reaches the apache server. 

### Custom AMI

To reduce the lines of bootstrap code and improve boot time I created a custom AMI from the EC2 instance spun up by terraform. It contains the following modifications from standard ubuntu AMI:
* Libraries Installed
  * apache2
  * python3-pip
  * pymysql
* Disabled ufw

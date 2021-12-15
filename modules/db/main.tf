resource "aws_db_instance" "my_database_instance" {
    allocated_storage = 10
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t2.micro"
    port = 3306
    vpc_security_group_ids = ["${aws_security_group.db_security_group.id}"]
    db_subnet_group_name = "${aws_db_subnet_group.my_database_subnet_group.name}"
    name = "mydb"
    identifier = "mysqldb"
    username = "myuser"
    password = "mypassword"
    parameter_group_name = "default.mysql5.7"
    skip_final_snapshot = true
    tags = {
        Name = "my_database_instance"
    }
}
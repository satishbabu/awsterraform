provider "aws" {
    region = "us-east-1"
}

resource "aws_db_instance" "mydb" {
    db_name = "myDB"
    identifier = "my-first-db"
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_version = "10.6.14"
    username = "somejunk"
    password = "somemorejunk"
    allocated_storage = 20
    port = 3306
    skip_final_snapshot = true
}

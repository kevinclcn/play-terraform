variable "host" {}

resource "null_resource" "hello" {
    triggers {
        version = "${timestamp()}"
    }
    provisioner "remote-exec" {
        connection = {
                type = "ssh"
                user = "long"
                host = "${var.host}"
                private_key = "${file("~/.ssh/id_rsa")}"
                bastion_host = "dmz"
                bastion_port = "10022"
                bastion_user = "long"
        }
        inline = [
            "echo hello >> hello1.txt"
        ]
    }
}
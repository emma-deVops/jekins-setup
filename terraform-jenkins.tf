provider "aws" {
  region = "us-east-2"
}

module "ec2_instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 3.0"
  for_each               = toset(["Server"])
  name                   = "Jenkins-${each.key}"
  ami                    = "ami-0eea504f45ef7a8f7"
  instance_type          = "t2.small"
  key_name               = "myAnsibleKey"
  # vpc_security_group_ids = ["sg-0cf366cae8c62a653"]
  user_data              = <<EOF
#!/bin/bash

sudo hostnamectl set-hostname jenkins
sudo su - ubuntu
sudo apt update
sudo apt-get install default-jdk -y
sudo apt install maven -y

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
sudo systemctl start jenkins

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

  EOF
}
 # Ubuntu  18.04 installation
# wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
# echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
# wget https://pkg.jenkins.io/debian-stable/binary/jenkins_2.332.3_all.deb
# sudo dpkg -i jenkins_2.332.3_all.deb
# sudo apt update
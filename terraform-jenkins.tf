provider "aws" {
  region = "us-east-2"
}

module "ec2_instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 3.0"
  for_each               = toset(["Dev"])
  name                   = "Jenkins-${each.key}"
  ami                    = "ami-03a0c45ebc70f98ea"
  instance_type          = "t2.medium"
  key_name               = "mgnkeypair"
  vpc_security_group_ids = ["sg-0cf366cae8c62a653"]
  user_data              = <<EOF
#!/bin/bash

sudo hostnamectl set-hostname jenkins
sudo su - ubuntu
sudo apt update
sudo apt-get install default-jdk -y
sudo apt install maven -y
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
wget https://pkg.jenkins.io/debian-stable/binary/jenkins_2.332.3_all.deb
sudo dpkg -i jenkins_2.332.3_all.deb
sudo apt update
sudo apt-get install jenkins -y
echo "Your password is below"
echo
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

  EOF
}
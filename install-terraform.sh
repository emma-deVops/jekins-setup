#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install wget

wget https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.7_darwin_amd64.zip

brew install unzip

unzip terraform_1.1.9_linux_amd64.zip

chmod +x terraform

sudo mv terraform /usr/local/bin/

terraform --version
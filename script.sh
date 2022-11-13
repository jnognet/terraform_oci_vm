#/bin/env bash
find  /home/vagrant/scripts/ -type f -name "*.sh"  | xargs chmod +x

sudo apt update -y && sudo apt upgrade -y

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform
terraform -install-autocomplete
terraform --version

sudo apt autoremove

sudo -u vagrant curl -o /home/vagrant/install.sh https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh
sudo -u vagrant chmod +x /home/vagrant/install.sh 
sudo -u vagrant /home/vagrant/install.sh --accept-all-defaults 
sudo -u vagrant rm -f /home/vagrant/install.sh 
sudo -u vagrant /home/vagrant/bin/oci --version

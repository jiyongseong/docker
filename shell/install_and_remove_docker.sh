
# remove docker
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io
sudo apt-get autoremove -y docker-ce docker-ce-cli containerd.io

sudo rm -rf /var/lib/docker /etc/docker
sudo rm -rf /etc/docker
sudo rm -rf /var/run/docker.sock
sudo rm -rf ~/.docker 

# install docker
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# permission issue
sudo usermod -a -G docker $USER
sudo service docker restart
# logout and login
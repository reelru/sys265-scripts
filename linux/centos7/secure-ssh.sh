#SECURE-SSH.SH
#AUTHOR REELRU (ELLA)
#Creates a new ssh user called $1
#Adds a public key to that users authorized in keys file
#Removes root ability to ssh in

#  Creates a user that logs in via RSA Private Key

sudo useradd $1
sudo mkdir /home/$1/.ssh
sudo cp ../public-keys/sys265.pub /home/$1/.ssh/authorized_keys
sudo chmod 700 /home/$1/.ssh
sudo chmod 600 /home/$1/.ssh/authorized_keys
sudo chown -R $1:$1 /home/$1/.ssh

#  Changes the sshd file to disallow root login

sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sudo systemctl restart sshd

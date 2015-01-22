# This script will run the first time the virtual machine boots
# It is ran as root.

# Expire the user account
#passwd -e user

# Regenerate ssh keys
rm /etc/ssh/ssh_host*key*
dpkg-reconfigure -fnoninteractive -pcritical openssh-server
dpkg-reconfigure -fnoninteractive -pcritical keyboard-configuration
setupcon

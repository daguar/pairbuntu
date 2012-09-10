#!/bin/bash
# Copyright 2012 Dave Guarino, MIT License + Beer License. No liability or implied guarantees at all whatsoever; truly use at your own risk.

# WARNING 1: This setup is not particularly secure: it uses password authentication for ssh, 
# which introduces a host of security vulnerabilities. I am not responsible for any 
# consequences of this. If you want to avoid problems, modify it to make it more secure.
# This is intended to just be a quick-and-easy setup for a pair-programming environment 
# and the server should be turned off as soon as you're done.

# WARNING 2: Amazon EC2 instances cost money! So make sure you turn them off when you're
# not using them to avoid being charged!

# First, on your computer, log into the server using the key you assigned the server:
#   ssh -i ~/.ssh/your_key_from_amazon_filename_here.pem ubuntu@ec2-9999-9999-9999-9999.compute-1.amazonaws.com
# (Note your values will be different.)

# Once you're logged in, run this command:
#   wget https://raw.github.com/daguar/pairbuntu/master/pairbuntu.sh
# Then run the script with sudo:
#   sudo bash pairbuntu.sh


echo -e "Set a new password for ubuntu, the superuser account.\n"
passwd ubuntu

echo -e "\n\n\n\n=========================================================================="
echo -e "Setting up first user: coder1 (Set the password; for other user details you can hit enter to skip."
echo -e "==========================================================================\n\n"
adduser coder1
adduser coder1 admin

echo -e "\n\n\n\n=========================================================================="
echo -e "Setting up second user: coder2 (Set the password; for other user details you can hit enter to skip."
echo -e "==========================================================================\n\n"
adduser coder2
adduser coder2 admin

echo -e "\nNote: both coder1 and coder2 have sudo.\n\n"

# Change ssh to use password auth
sed -i 's/PasswordAuthentication\ no/PasswordAuthentication\ yes/' /etc/ssh/sshd_config
echo -e "\nRestarting ssh to enable password authentication.\n\n"
service ssh restart

chmod +s /usr/bin/screen
chmod 755 /var/run/screen
echo -e "multiuser on\nacladd coder2" > /home/coder1/.screenrc
chown coder1 /home/coder1/.screenrc

echo -e "\n\n\n\n\n\n============= w00t =============\n\n"
echo -e "Setup is complete.\n\nNext, have your buddy log in via ssh as coder2, using the password you set up for that account.\n\n  ssh coder2@ec2-9999-9999-9999-9999.compute-1.amazon.com\n  (Remember to replace the ec2-999... above with your own instance's address.)\n\n\nYou're now logged in as coder1. So go ahead and type:\n\n  screen -S pairprog\n\nto start your pairing session, and have your buddy run\n\n  screen -x coder1/pairprog\n\nafter logging in to enter your shared screen.\n\n\nFor more help, use 'man screen' to learn more about how screen works.\n\n"
su coder1
cd ~

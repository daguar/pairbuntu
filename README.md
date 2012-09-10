pairbuntu
=========

Simple script to configure an Amazon EC2 Ubuntu instance for quick pair programming/screen sharing. Designed for those:
  - Lacking a shared server
  - Unfamiliar with basic Unix or Amazon EC2

to get a quick shared session up and running.

The script helps you interactively set up two users (coder1 and coder2), configures screen for sharing, and then gives you the commands to execute.

Inspiration/lots of the commands are taken from this tutorial: http://blog.siyelo.com/remote-pair-programming-with-screen
So kudos and thanks to Siyelo! Any errors/vulnerabilities here are my own, and no fault of theirs.


Setup:
------

1. Go into your Amazon Web Services console and boot up a new Ubuntu instance (under the Quick Launch Wizard, use Ubuntu Server 12.04 LTS).

2. Once the instance is running, connect to it using ssh and the key you assigned the instance:

        ssh -i ~/.ssh/your_key_from_amazon_filename_here.pem ubuntu@ec2-9999-9999-9999-9999.compute-1.amazonaws.com

   (Note: remember to edit this command to reflect your AWS key file and the address of your Amazon EC2 instance.)

3. Once logged in, run this command; when first prompted for a password, type 'ubuntu' (without quotes). Note that you'll set a few passwords.

        wget https://raw.github.com/daguar/pairbuntu/master/pairbuntu.sh && sudo bash pairbuntu.sh

4. Follow the instructions, and start showing off some code in your brand spanking new shared terminal!


Etc:
----

WARNING 1:
This setup is not particularly secure: it uses password authentication for ssh, 
which introduces a host of security vulnerabilities. I am not responsible for any 
consequences of this. If you want to avoid problems, modify it to make it more secure.
This is intended to just be a quick-and-easy setup for a pair-programming environment 
and the server should be turned off as soon as you're done.

WARNING 2:
Amazon EC2 instances cost money! So make sure you turn them off when you're
not using them to avoid being charged!

Copyright 2012 Dave Guarino. MIT+Beer License, double whammy.
No liability or implied guarantees at all whatsoever; truly use at your own risk.

Like, seriously.

Really.

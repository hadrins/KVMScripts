# KVM Menu script. 
Use this on a KVM system. 
Requirements
Linux :) with KVM dependies installed and Virtual machines installed.  I use it on Ubuntu with no problems. 
This allows you to have console access to the virtual machine,  That right you can see console error and watch it reboot and load. SSHD is not needed nor networking.  You can login and setup anything that may be borken and not allowing you to connect in other ways.   This is also great for doing updates as you are connected to the vitrual console and anynetwork errors or disconnect and you can just reconnect again from the KVM server. 
I wrote the script to require root.  Just because you can shutdown, start, and connect to the console. 
Maybe one day I will add the menu to do back ups. 

You need to edit the enable the serial console on the VM and start it. 

systemctl enable serial-getty@ttyS0.service
systemctl start serial-getty@ttyS0.service

Execute the script and it should start by listing the VMs installed on your server and allow you to select a VM. 
From the you can start, shutdown, and connect to the console. 
TO disconnect from a console press "CTRL-]" 

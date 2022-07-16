# KVM Menu script. 
Use this on a KVM system. 
Requirements
Linux :) with KVM dependies installed and Virtual machines installed.  I use it on Ubuntu with no problems. 

This allows you to have console access to the virtual machine,  That right you can see console error and watch it reboot and load. SSHD is not needed nor networking.  You can login and setup anything that may be borken and not allowing you to connect in other ways.   This is also great for doing updates as you are connected to the vitrual console and any network errors or disconnect and you can just reconnect again from the KVM server. 
I wrote the script to require root.  Just because you can shutdown, start, and connect to the console. 
Maybe one day I will add the menu to do back ups. 

You need to edit the enable the serial console on the VM and start it. 
systemctl enable serial-getty@ttyS0.service<br>
systemctl start serial-getty@ttyS0.service

You also need to add this on the Virtual machine console. 
edit /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="console=ttyS0 xterm"
Wonder what making this ansi do? 

Execute the script and it should start by listing the VMs installed on your server and allow you to select a VM. 
From there you can start, shutdown, and connect to the console. 
TO disconnect from a console press "CTRL-]" 
When retruning to the KVM server you may need to press enter to get the menu.

I like using this when applying updates and doing system reboots. 

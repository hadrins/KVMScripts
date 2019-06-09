#!/bin/bash
        if (( "$EUID" != 0 ));
        then
                echo "Please run as root"
                exit 1
        fi
# Read command output line by line into array ${lines [@]}
# Bash 3.x: use the following instead:
#   IFS=$'\n' read -d '' -ra lines < <(visrh list --all --name)
while true; do
readarray -t lines < <(virsh list --all | grep -i 'running\|shut')

# Prompt the user to select one of the lines.
echo "Please select a Virtual Machine:"
select choice in "${lines[@]}"; do
  [[ -n $choice ]] || { echo "Invalid choice. Please try again." >&2; continue;
}
  break # valid choice was made; exit prompt.
done

# Split the chosen line into ID and serial number.
read -r ID VMName State <<<"$choice"
echo "VMName: [$VMName] State: [$State]"
echo "You selected $VMName"
echo "Select an option:"
options=("shutdown" "start" "console" "Back")
select opt in "${options[@]}"
do
case $opt in
 "shutdown")
   virsh shutdown $VMName
   ;;
 "start")
   virsh start $VMName
   ;;
 "console")
   virsh console $VMName
   ;;
 "Back")
   break
   ;;
 *) echo "Invalid option $REPLY";;
esac
done

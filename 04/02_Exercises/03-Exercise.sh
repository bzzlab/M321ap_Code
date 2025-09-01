#!/bin/bash
:<<'TASK'
Deleting deployments on minikube with a script

Prerequisite:
You need to install package 'fzf' (super handy tool for interactive menus
with arrow keys) on your EC2 Instance.

1. Program a safe interactive bash script that first does a dry-run,
shows you what would be deleted, then asks for confirmation
before actually deleting:

The relevant steps are:
a. Lists all deployments in the chosen namespace.
b. Prints them out (like a dry-run preview).
c. Select specific deployments (or all) by number to actually delete
d. Asks confirmation (i.e. Do you want to proceed? (y/N))
e. Only deletes if you type y or Y.

2. Test your script on your EC2 Instance running more than two deployments.
TASK

# set the namespace to work with (change if needed)
NAMESPACE=default

echo "Checking deployments in namespace: $NAMESPACE"

# Get all deployment names and
# store it in the variable DEPLOYMENTS
#??

# If DEPLOYMENTS is empty then
# write an appropriate message and exit the script
#??
#??
#??
#??

echo "Dry-run preview (no deletions yet):"
# Loop through all DEPLOYMENTS and dry-run (as preview) the deletion
#??
#??
#??

echo
echo "Use arrow keys or type to filter, then press Enter to select:"
SELECTED=$(echo "$DEPLOYMENTS" | tr ' ' '\n' | fzf --multi --prompt="Select deployments> ")

# If nothing selected, exit
#??
#??
#??
#??

echo "You selected:"
#??

echo
read -p "Do you want to proceed with deletion of the selected deployments? (y/N): " CONFIRM

# If deletion is confirmed
# then delete deployment else abort.
#??
#??
#??
#??
#??
#??
#??
#??
#??


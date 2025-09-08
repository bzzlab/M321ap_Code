#!/bin/bash
:<<'TASK'
Exercise 4: Deleting deployments on minikube with a script

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
#---------------------------------------------------------------
function install_package() {
  local CMD=$1
  echo "Checking ${CMD} installation ..."
  if command -v ${CMD} &> /dev/null; then
      VER=$(${CMD} --version)
      echo "${CMD} version ${VER} is installed!"
  else
      echo "${CMD} installation not found. Installing now ..."
      sudo apt  install ${CMD}
  fi
}
#---------------------------------------------------------------
# install package
install_package "fzf"

# set the namespace to work with (change if needed)
NAMESPACE=default
echo "Checking deployments in namespace: $NAMESPACE"

# Get all deployment names and
# store it in the variable DEPLOYMENTS
DEPLOYMENTS=$(kubectl get deployments -n "$NAMESPACE" -o jsonpath='{.items[*].metadata.name}') #??

# If DEPLOYMENTS is empty then
# write an appropriate message and exit the script
if [ -z "$DEPLOYMENTS" ]; then #??
  echo "No deployments found in namespace '$NAMESPACE'." #??
  exit 0 #??
fi #??

echo "Dry-run preview (no deletions yet):"
# Loop through all DEPLOYMENTS and dry-run (as preview) the deletion
for DEPLOYMENT in $DEPLOYMENTS; do #??
  kubectl delete deployment "$DEPLOYMENT" -n "$NAMESPACE" --dry-run=client -o name #??
done #??

echo
echo "Use arrow keys or type to filter, then press Enter to select:"
SELECTED=$(echo "$DEPLOYMENTS" | tr ' ' '\n' | fzf --multi --prompt="Select deployments> ")

# If nothing selected, exit
if [ -z "$SELECTED" ]; then #??
  echo "❌ No deployments selected. Exiting." #??
  exit 0 #??
fi #??

echo "You selected:"
echo "$SELECTED" | sed 's/^/  - /' #??

echo
read -p "Do you want to proceed with deletion of the selected deployments? (y/N): " CONFIRM

# If deletion is confirmed
# then delete deployment else abort.
if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then #??
  for DEPLOYMENT in $SELECTED; do #??
    echo "Deleting deployment: $DEPLOYMENT" #??
    kubectl delete deployment "$DEPLOYMENT" -n "$NAMESPACE" #??
  done #??
  echo "✅ Selected deployments deleted." #??
else #??
  echo "❌ Aborted. No deployments were deleted." #??
fi #??


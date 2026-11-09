
#environment set up notes

**Platform:** Ubuntu 24.04 (Azure VM) 
** VS code was installed on Windows PC | to ssh if need to 

**Package manager:** apt (official vendor repos for Docker, Terraform, VS Code);
direct binary install for kubectl; vendor scripts for Helm, Azure CLI, AWS CLI.

## Troubleshooting
1. `minikube start` failed with PROVIDER_DOCKER_NEWGRP / permission denied on
   /var/run/docker.sock. rootcause: my user account was not in the `docker` group in the
   running session. `getent group docker` listed me but `id -nG` did not.

   Resolution: `sudo usermod -aG docker $USER`, then logged out and back in.
 

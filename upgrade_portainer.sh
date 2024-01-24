#!/bin/bash

# Stop the existing Portainer container
sudo docker stop portainer

# Remove the existing Portainer container
sudo docker rm portainer

# Pull the latest Portainer image
sudo docker pull portainer/portainer-ce:latest

# Run a new Portainer container using the updated image
sudo docker run -d \
  --name="portainer" \
  --restart=unless-stopped \
  -p 9000:9000 \
  -p 8000:8000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest

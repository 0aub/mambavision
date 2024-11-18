#!/bin/bash

# Variables
IMAGE_NAME="mambavision_image"               # Name of the Docker image
CONTAINER_NAME="mambavision_container"       # Name of the Docker container
FINAL_IMAGE_NAME="mambavision_image_final"   # Name of the final saved image

# Path to mount (change this to your project directory)
HOST_DIR=$(pwd)         # Current directory on host
CONTAINER_DIR="/app"    # Directory in container (as defined in Dockerfile)

# Step 1: Build the Docker image from the Dockerfile
echo "Building Docker image..."
docker build -t $IMAGE_NAME .

# Step 2: Run the container with volume mounting for real-time changes
echo "Running Docker container with volume mounting..."
docker run -it --name $CONTAINER_NAME --privileged --gpus all --privileged -v "$HOST_DIR:$CONTAINER_DIR" $IMAGE_NAME /bin/bash

# Step 3: Commit the container changes to a new image after you exit
echo "Committing container changes to a new image..."
docker commit $CONTAINER_NAME $FINAL_IMAGE_NAME

# Step 4: Clean up the original container and intermediate image
echo "Cleaning up..."
docker rm $CONTAINER_NAME
docker rmi $IMAGE_NAME

echo "Process completed. The final image is saved as $FINAL_IMAGE_NAME."

#!/bin/bash

# Local Docker registry credentials
LOCAL_REGISTRY="localhost:5000"
USERNAME="ati"
PASSWORD="ati1234"

# Images to pull and push
IMAGES=(
  "postgres:latest"
  "redis:latest"
  "mongo:latest"
  "mongo-express:latest"
)

# Log in to the local Docker registry
echo $PASSWORD | docker login $LOCAL_REGISTRY -u $USERNAME --password-stdin

# Pull, tag, and push each image
for IMAGE in "${IMAGES[@]}"; do
  docker pull $IMAGE
  docker tag $IMAGE $LOCAL_REGISTRY/$IMAGE
  docker push $LOCAL_REGISTRY/$IMAGE
done

# Log out from the local Docker registry
docker logout $LOCAL_REGISTRY


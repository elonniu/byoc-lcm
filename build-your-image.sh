#!/bin/bash

set -e

export REGION="ap-southeast-1"
# shellcheck disable=SC2155
export ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
export REPO="$ACCOUNT_ID.dkr.ecr.${REGION}.amazonaws.com"
export BYOC="$ACCOUNT_ID.dkr.ecr.${REGION}.amazonaws.com/stable-diffusion-aws-extension/aigc-webui-inference:lcm"
export IMAGE_BASE="$ACCOUNT_ID.dkr.ecr.${REGION}.amazonaws.com/stable-diffusion-aws-extension/aigc-webui-inference:latest"

# Login ECR for build and push your image
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin "$REPO"

# Build your image
docker build --build-arg IMAGE_BASE="$IMAGE_BASE" -f Dockerfile -t "$BYOC" .

# Push your image to ECR
docker push "$BYOC"

echo "Your image is ready to use:"
echo "$BYOC"

# Use your base docker image
FROM 515139160808.dkr.ecr.us-east-1.amazonaws.com/stable-diffusion-aws-extension/aigc-webui-inference:latest

# Download the extension
RUN mkdir -p /opt/ml/code/extensions/ && \
    cd /opt/ml/code/extensions/ && \
    git clone https://github.com/continue-revolution/sd-webui-animatediff.git

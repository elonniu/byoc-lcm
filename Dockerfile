# Use your base docker image
ARG IMAGE_BASE
FROM ${IMAGE_BASE}

# Download the extension
RUN mkdir -p /opt/ml/code/extensions/ && \
    cd /opt/ml/code/extensions/ && \
    git clone https://github.com/continue-revolution/sd-webui-animatediff.git

# Use your base docker image
FROM public.ecr.aws/aws-gcr-solutions/stable-diffusion-aws-extension/aigc-webui-inference:inference-optimize

COPY serve_start /opt/ml/code/

# Download the extension
RUN mkdir -p /opt/ml/code/extensions/ && \
    cd /opt/ml/code/extensions/ && \
    git clone https://github.com/continue-revolution/sd-webui-animatediff.git && \
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg.git

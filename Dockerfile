FROM runpod/worker-comfyui:5.7.1-base

WORKDIR /comfyui

# Only cg-use-everywhere - remove Easy-Use and Qwen nodes
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

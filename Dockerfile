FROM runpod/worker-comfyui:5.7.1-flux1-dev

WORKDIR /comfyui

# cg-use-everywhere
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

# Add extra model paths
COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml

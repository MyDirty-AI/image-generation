FROM runpod/worker-comfyui:5.8.5-base

WORKDIR /comfyui

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml

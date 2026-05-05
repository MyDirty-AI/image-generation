FROM runpod/worker-comfyui:5.8.5-base

WORKDIR /comfyui

# cg-use-everywhere
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

# ComfyUI-GGUF node for loading GGUF models
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/city96/ComfyUI-GGUF.git && \
    cd ComfyUI-GGUF && \
    pip install -r requirements.txt

COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml

FROM runpod/worker-comfyui:5.7.1-base

WORKDIR /comfyui

# Install aria2 for fast parallel downloads
RUN apt-get update && apt-get install -y aria2 && rm -rf /var/lib/apt/lists/*

# Custom nodes
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/yolain/ComfyUI-Easy-Use.git && \
    cd ComfyUI-Easy-Use && pip install -r requirements.txt || true

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/lrzjason/Comfyui-QwenEditUtils.git && \
    cd Comfyui-QwenEditUtils && pip install -r requirements.txt || true

# Bake Qwen v23 into image with 16 parallel connections
RUN aria2c -x 16 -s 16 --file-allocation=none \
    "https://huggingface.co/Phr00t/Qwen-Image-Edit-Rapid-AIO/resolve/main/v23/Qwen-Rapid-AIO-NSFW-v23.safetensors" \
    -d /comfyui/models/checkpoints/ \
    -o Qwen-Rapid-AIO-NSFW-v23.safetensors

# Verify model downloaded correctly
RUN ls -lh /comfyui/models/checkpoints/

COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml

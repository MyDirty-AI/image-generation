FROM runpod/worker-comfyui:5.7.1-base

WORKDIR /comfyui

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/yolain/ComfyUI-Easy-Use.git && \
    cd ComfyUI-Easy-Use && pip install -r requirements.txt || true

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/lrzjason/Comfyui-QwenEditUtils.git && \
    cd Comfyui-QwenEditUtils && pip install -r requirements.txt || true

RUN wget -q --show-progress \
    "https://huggingface.co/Phr00t/Qwen-Image-Edit-Rapid-AIO/resolve/main/v23/Qwen-Rapid-AIO-NSFW-v23.safetensors" \
    -O /comfyui/models/checkpoints/Qwen-Rapid-AIO-NSFW-v23.safetensors

COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml

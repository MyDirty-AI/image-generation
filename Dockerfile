FROM runpod/worker-comfyui:5.7.1-base

WORKDIR /comfyui

# ============================================================
# 1. Install Custom Nodes
# ============================================================

# ComfyUI-Easy-Use (provides: easy cleanGpuUsed)
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/yolain/ComfyUI-Easy-Use.git && \
    cd ComfyUI-Easy-Use && \
    if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# cg-use-everywhere (provides: Anything Everywhere)
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

# Comfyui-QwenEditUtils (provides: TextEncodeQwenImageEditPlus)
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/lrzjason/Comfyui-QwenEditUtils.git && \
    cd Comfyui-QwenEditUtils && \
    if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# ============================================================
# 2. Download Models
# ============================================================

# Download Qwen checkpoint: Qwen-Rapid-AIO-NSFW-v23
RUN wget --progress=bar:force:noscroll \
    --timeout=0 \
    --tries=3 \
    --continue \
    "https://huggingface.co/Phr00t/Qwen-Image-Edit-Rapid-AIO/resolve/main/v23/Qwen-Rapid-AIO-NSFW-v23.safetensors" \
    -O /comfyui/models/checkpoints/Qwen-Rapid-AIO-NSFW-v23.safetensors

# Download Lora: Unchained-XXX
RUN mkdir -p /comfyui/models/loras && \
    wget --progress=bar:force:noscroll \
    --timeout=0 \
    --tries=3 \
    --continue \
    "https://huggingface.co/huakas/mylora/resolve/main/Unchained-XXX.safetensors" \
    -O /comfyui/models/loras/Unchained-XXX.safetensors

# ============================================================
# 3. Verify All Downloads
# ============================================================

RUN echo "=== Verifying downloads ===" && \
    ls -lh /comfyui/models/checkpoints/Qwen-Rapid-AIO-NSFW-v23.safetensors && \
    ls -lh /comfyui/models/loras/Unchained-XXX.safetensors && \
    echo "=== Custom nodes installed ===" && \
    ls -lh /comfyui/custom_nodes/ && \
    echo "=== All verified ==="

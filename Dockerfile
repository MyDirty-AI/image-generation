FROM runpod/worker-comfyui:5.7.1-base

WORKDIR /comfyui

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

FROM runpod/worker-comfyui:5.7.1-base

WORKDIR /comfyui

# ComfyUI-Easy-Use
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/yolain/ComfyUI-Easy-Use.git && \
    cd ComfyUI-Easy-Use && \
    if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# cg-use-everywhere
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

# ComfyUI-GGUF (needed for FLUX.2 Klein)
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/city96/ComfyUI-GGUF.git && \
    cd ComfyUI-GGUF && \
    if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

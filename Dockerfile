FROM runpod/worker-comfyui:5.7.1-base

WORKDIR /comfyui

# Install Custom Nodes
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/yolain/ComfyUI-Easy-Use.git && \
    cd ComfyUI-Easy-Use && \
    if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/lrzjason/Comfyui-QwenEditUtils.git && \
    cd Comfyui-QwenEditUtils && \
    if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# Copy link script — base image will run it via STARTUP_SCRIPT env var
COPY link_models.sh /link_models.sh
RUN chmod +x /link_models.sh

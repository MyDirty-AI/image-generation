FROM runpod/worker-comfyui:5.7.1-base

WORKDIR /comfyui

# ============================================================
# 1. Install Custom Nodes
# ============================================================

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

# ============================================================
# 2. Link models from Network Volume at startup
# ============================================================

COPY link_models.sh /link_models.sh
RUN chmod +x /link_models.sh

ENV STARTUP_SCRIPT=/link_models.sh

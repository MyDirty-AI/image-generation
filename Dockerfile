FROM runpod/worker-comfyui:5.8.5-base
WORKDIR /comfyui

RUN apt-get update && apt-get install -y \
    aria2 libgl1 libglib2.0-0 \
    python3-dev build-essential cmake \
    && rm -rf /var/lib/apt/lists/*

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/Acly/comfyui-tooling-nodes.git

RUN /opt/venv/bin/pip install --no-cache-dir accelerate xformers

RUN /opt/venv/bin/pip install --no-cache-dir cython

RUN /opt/venv/bin/pip install --no-cache-dir \
    "insightface==0.7.3" \
    opencv-python-headless

COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml

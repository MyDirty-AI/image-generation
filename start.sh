#!/bin/bash

echo "=== Linking models from network volume ==="
bash /link_models.sh

echo "=== Starting ComfyUI worker ==="
# Find and execute the original entrypoint
if [ -f /docker-entrypoint.sh ]; then
    exec /docker-entrypoint.sh
elif [ -f /start.py ]; then
    exec python -u /start.py
elif [ -f /handler.py ]; then
    exec python -u /handler.py
else
    exec python -u -m runpod
fi

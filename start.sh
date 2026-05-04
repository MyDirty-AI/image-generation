#!/bin/bash

echo "=== Running startup script ==="
bash /link_models.sh

echo "=== Starting ComfyUI worker ==="
exec python -u /start.py

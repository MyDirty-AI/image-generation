#!/bin/bash

echo "=== Linking models from network volume ==="

mkdir -p /comfyui/models/checkpoints
mkdir -p /comfyui/models/loras

ln -sf /runpod-volume/checkpoints/Qwen-Rapid-AIO-NSFW-v23.safetensors \
  /comfyui/models/checkpoints/Qwen-Rapid-AIO-NSFW-v23.safetensors

ln -sf /runpod-volume/loras/Unchained-XXX.safetensors \
  /comfyui/models/loras/Unchained-XXX.safetensors

echo "=== Models linked successfully ==="

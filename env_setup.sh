#source
# set /root/.cache 
mkdir -p /app/tensorrt_llm
export HF_MODULE_CACHE="/app/tensorrt_llm/"
export TRANSFORMERS_CACHE="/app/tensorrt_llm/"
export XDG_CACHE_HOME="/app/tensorrt_llm/"
export CUDA_VISIBLE_DEVICES=0   
export HF_ENDPOINT=https://hf-mirror.com # Or use HF_ENDPOINT=https://hf-mirror.com python your_script.py

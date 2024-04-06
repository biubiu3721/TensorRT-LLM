#source
# set /root/.cache 
mkdir -p /app/tensorrt_llm
export HF_MODULE_CACHE="/app/tensorrt_llm/"
export TRANSFORMERS_CACHE="/app/tensorrt_llm/"
export XDG_CACHE_HOME="/app/tensorrt_llm/"
export CUDA_VISIBLE_DEVICES=0                                   

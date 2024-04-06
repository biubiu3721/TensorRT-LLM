# Convert
python3 ../convert_checkpoint.py \
--model_dir ../../../model/Baichuan2-7B-Base/ \
--output_dir ./tmp/baichuan_v2_7b/trt_ckpts/sq0.8/1-gpu  \
--model_version v2_7b --dtype float16 \
--smoothquant 0.8 --per_channel --per_token


# build
trtllm-build  \
--checkpoint_dir ./tmp/baichuan_v2_7b/trt_ckpts/sq0.8/1-gpu/ \
--output_dir=./tmp/baichuan_v2_7b/trt_engines/sq0.8/1-gpu/ \
--max_input_len=1024 --max_output_len=512 \
# --gather_context_logits --gather_generation_logits # needed in --test_ppl


# run 
python3 ../../run.py --input_text "世界上第二高的山峰是哪座？" \
--tokenizer_dir=../../../model/Baichuan2-7B-Base \
--engine_dir ./tmp/baichuan_v2_7b/trt_engines/sq0.8/1-gpu/ \
--max_output_len=50 


# summarize
python3 ./summarize.py \
--hf_model_dir ../../../model/Baichuan2-7B-Base/ \
--engine_dir ./tmp/baichuan_v2_7b/trt_engines/sq0.8/1-gpu/ \
--data_type fp16 \
--test_trt_llm --test_hf  \
 --eval_ppl # need more memory

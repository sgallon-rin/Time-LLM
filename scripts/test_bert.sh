model_name=TimeLLM
train_epochs=100
learning_rate=0.01
llm_model=BERT
llm_dim=768
llm_layers=12 #full
#llm_layers=6 #default

master_port=00097
num_process=8
batch_size=24
d_model=32
d_ff=128

comment='TimeLLM-ETTh1'

accelerate launch --mixed_precision bf16 --num_processes $num_process --main_process_port $master_port run_main.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ETT-small/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_512_96 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --seq_len 512 \
  --label_len 48 \
  --pred_len 96 \
  --factor 3 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --itr 1 \
  --d_model $d_model \
  --d_ff $d_ff \
  --batch_size $batch_size \
  --learning_rate $learning_rate \
  --llm_model $llm_model \
  --llm_dim $llm_dim \
  --llm_layers $llm_layers \
  --train_epochs $train_epochs \
  --model_comment $comment
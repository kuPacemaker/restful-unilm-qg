SRC=~/code/unilm/unilm-v1/src
DATA_DIR=${SRC}/data/train
OUTPUT_DIR=${SRC}/pretrained
MODEL_RECOVER_PATH=${OUTPUT_DIR}/unilm1-large-cased.bin
TEMP_DIR=${SRC}/temp

export PYTORCH_PRETRAINED_BERT_CACHE=/${TEMP_DIR}/bert-cased-pretrained-cache
export CUDA_VISIBLE_DEVICES=0,1

python biunilm/run_seq2seq.py --do_train --num_workers 2 \
  --bert_model bert-large-cased --new_segment_ids --tokenized_input \
  --data_dir ${DATA_DIR} --src_file train.pa.tok.txt --tgt_file train.q.tok.txt \
  --output_dir ${OUTPUT_DIR}/bert_save \
  --log_dir ${OUTPUT_DIR}/bert_log \
  --model_recover_path ${MODEL_RECOVER_PATH} \
  --max_seq_length 512 --max_position_embeddings 512 \
  --mask_prob 0.7 --max_pred 48 \
  --train_batch_size 8 --gradient_accumulation_steps 2 \
  --learning_rate 0.00002 --warmup_proportion 0.1 --label_smoothing 0.1 \
  --num_train_epochs 10

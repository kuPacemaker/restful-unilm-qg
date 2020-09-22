SRC=~/code/unilm/unilm-v1/src
DATA_DIR=${SRC}/data/test
MODEL_RECOVER_PATH=${SRC}/finetuned/qg_model.bin
EVAL_SPLIT=test
TEMP_DIR=${SRC}/temp
export PYTORCH_PRETRAINED_BERT_CACHE=/${TEMP_DIR}/bert-cased-pretrained-cache
# run decoding
python biunilm/decode_seq2seq.py --bert_model bert-large-cased --new_segment_ids --mode s2s \
  --input_file ${DATA_DIR}/words.txt --split ${EVAL_SPLIT} \
  --model_recover_path ${MODEL_RECOVER_PATH} \
  --max_seq_length 512 --max_tgt_length 48 \
  --batch_size 16 --beam_size 1 --length_penalty 0 \
  #--tokenized_input
# run evaluation using our tokenized data as reference
# python qg/eval_on_unilm_tokenized_ref.py --out_file qg/output/qg.test.output.txt
# run evaluation using tokenized data of Du et al. (2017) as reference
# python qg/eval.py --out_file qg/output/qg.test.output.txt

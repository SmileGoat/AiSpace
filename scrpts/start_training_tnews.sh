#!/usr/bin/env bash

export CUDA_VISIBLE_DEVICES=4,5,6,7
nohup python -u aispace/trainer.py \
    --experiment_name test \
    --model_name bert_for_classification \
    --schedule train_and_eval \
    --config_name tnews \
    --config_dir ./configs/glue_zh \
    --gpus 0 1 2 3 \
    > err.log 2>&1 &
#!/bin/bash
 
#####################################################
# Copyright (c) 2020 Sogou, Inc. All Rights Reserved
#####################################################
# File:    start_deploy_duee.sh
# Author:  root
# Date:    2020/04/17 15:10:21
# Brief:
#####################################################


TRIGGER_DEPLOY_PATH="/search/data1/yyk/workspace/projects/AiSpace/save/trigger_bert_for_ner_119_20/deploy/BertNerService/20200424150518_52468B"
ROLE_DEPLOY_PATH="/search/data1/yyk/workspace/projects/AiSpace/save/role_bert_for_role_ner_v2_119_44/deploy/RoleBertNerService/20200424150955_992C04"
# reduce label
#ROLE_DEPLOY_PATH="/search/data1/yyk/workspace/projects/AiSpace/save/role_bert_for_role_ner_v2_119_70/deploy/RoleBertNerService/20200428163648_B9D503"
#EVENT_TYPE_DEPLOY_PATH="save/trigger_bert_for_classification_119_17/deploy/BertTextClassificationService/20200426162858_B723CC"
EVENT_TYPE_DEPLOY_PATH="save/trigger_bert_for_classification_119_19/deploy/BertTextClassificationService/20200426183441_4281E0"

export BENTOML__APISERVER__DEFAULT_PORT=5000
TF_FORCE_GPU_ALLOW_GROWTH=true CUDA_VISIBLE_DEVICES=4 bentoml serve $TRIGGER_DEPLOY_PATH > trigger_extract_deploy.log 2>&1 &
echo "Start trigger extract service."

export BENTOML__APISERVER__DEFAULT_PORT=5001
TF_FORCE_GPU_ALLOW_GROWTH=true CUDA_VISIBLE_DEVICES=4 bentoml serve $ROLE_DEPLOY_PATH > role_extract_deploy.log 2>&1 &
echo "Start role extract service."

export BENTOML__APISERVER__DEFAULT_PORT=5002
TF_FORCE_GPU_ALLOW_GROWTH=true CUDA_VISIBLE_DEVICES=4 bentoml serve $EVENT_TYPE_DEPLOY_PATH > event_type_extract_deploy.log 2>&1 &
echo "Start event type extract service."











# vim: set expandtab ts=4 sw=4 sts=4 tw=100

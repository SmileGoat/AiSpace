# # -*- coding: utf-8 -*-
# # @Time    : 2020-06-03 15:51
# # @Author  : yingyuankai
# # @Email   : yingyuankai@aliyun.com
# # @File    : test_electra.py
#
import unittest
import tensorflow as tf

from aispace.utils.hparams import Hparams
from aispace.utils.builder_utils import build_model


class TestElectra(unittest.TestCase):
    def test_electra_checkpoint(self):
        hparam = Hparams()
        hparam.load_from_config_file('/search/data1/yyk/workspace/AiSpace/configs/glue_zh/tnews.yml')
        hparam.stand_by()

        # ckpt = "/search/data1/yyk/workspace/projects/ERNIE/ernie/checkpoints"
        # ckpt_vars = [itm for itm in tf.train.list_variables(ckpt) if itm[0].find('adam') == -1]
        ckpt_vars = [itm for itm in tf.train.list_variables(hparam.pretrained.model_path)
                     if itm[0].find('adam') == -1 and not itm[0].endswith("lamb_m") and not itm[0].endswith("lamb_v")]

        model, (losses, loss_weights), metrics, optimizer = build_model(hparam)
        model.compile(optimizer=optimizer, loss=losses, metrics=metrics)

        model_vars = model.trainable_variables

        print()
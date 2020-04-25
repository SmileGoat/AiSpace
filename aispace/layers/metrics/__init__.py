# -*- coding: utf-8 -*-
# @Time    : 2019-11-14 20:11
# @Author  : yingyuankai
# @Email   : yingyuankai@aliyun.com
# @File    : __init__.py

import tensorflow as tf
from prettytable import PrettyTable

from aispace.utils.print_utils import print_boxed

__all__ = [
    "METRICS",
    "print_available"
]


METRICS = {
    "categorical_accuracy": tf.keras.metrics.CategoricalAccuracy("categorical_accuracy"),
    "sparse_categorical_accuracy": tf.keras.metrics.SparseCategoricalAccuracy('sparse_categorical_accuracy'),
    "sparse_categorical_crossentropy": tf.keras.metrics.SparseCategoricalCrossentropy('sparse_categorical_crossentropy')
}

def print_available():
    table = PrettyTable(["NAME"])
    for key in METRICS:
        table.add_row([key])
    print()
    print(table)
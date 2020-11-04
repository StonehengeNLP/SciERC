import tensorflow as tf
from tensorflow.python import pywrap_tensorflow
from .util import SCIIE_DIR

srl_op_library = tf.load_op_library(SCIIE_DIR + "/srl_kernels.so")

extract_spans = srl_op_library.extract_spans
tf.NotDifferentiable("ExtractSpans")


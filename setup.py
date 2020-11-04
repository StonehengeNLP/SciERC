from glob import glob
from setuptools import find_packages, setup

data_files = []
data_files.extend(glob('sciie/data/**/*.*', recursive=True))
data_files.extend(glob('sciie/logs/scientific_best_coref/*'))

setup(
    name='spert',
    packages=find_packages(),
    data_files=[('config', ['spert/configs/eval.cfg', 'spert/configs/train.cfg']),
                ('data', data_files)],
    package_data={'': ['*.json'], '': ['*.cc', '*.txt']},
    include_package_data=True,
    version='1.0.0',
    description='spert',
    author='Me',
    license='MIT',
)
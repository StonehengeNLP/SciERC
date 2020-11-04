from glob import glob
from setuptools import find_packages, setup

# data_files = []
# data_files.extend(glob('sciie/data/**/*.*', recursive=True))
# data_files.extend(glob('sciie/logs/scientific_best_coref/*'))
# data_files.extend(glob('sciie/embeddings/*'))

setup(
    name='sciie',
    packages=find_packages(),
    data_files=[('config', ['sciie/experiments.conf']),
                # ('data', data_files)],
                ],
    package_data={'': ['*.json'], '': ['*.cc', '*.txt']},
    include_package_data=True,
    version='1.0.0',
    description='sciie',
    author='Me',
    license='MIT',
)
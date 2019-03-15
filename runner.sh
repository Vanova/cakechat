
source activate cake
export PYTHONPATH="${PYTHONPATH}:$(pwd)"

USE_GP=U0 python tools/train.py

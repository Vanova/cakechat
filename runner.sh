#!/bin/bash
# CakeChat model runner

source activate cake
export PYTHONPATH="${PYTHONPATH}:$(pwd)"

model=tune
log_dir=logs/$(date "+%d_%b_%Y")
log_file=$log_dir/${model}_$(date "+%H_%M_%S").log
mkdir $log_dir

echo "Log to: $log_file"
USE_GPU=0 python tools/train.py

# train in dev mode
model=scratch
log_dir=logs/$(date "+%d_%b_%Y")
log_file=$log_dir/${model}_$(date "+%H_%M_%S").log
mkdir $log_dir

echo "Log to: $log_file"
IS_DEV=1 python tools/train.py

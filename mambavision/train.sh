#!/bin/bash

MODEL=mamba_vision_T
DATA_PATH_TRAIN="data/splitted/train"
DATA_PATH_VAL="data/splitted/val"
DATA_PATH="data/uncompressed/flowers"
BS=16
EXP=my_experiment
LR=5e-4
WD=0.05
DR=0.2

# torchrun --nproc_per_node=8 train.py --input-size 3 224 224 --crop-pct=0.875 --train-split=$DATA_PATH_TRAIN --val-split=$DATA_PATH_VAL --model $MODEL --amp --weight-decay ${WD} --drop-path ${DR} --batch-size $BS --tag $EXP --lr $LR
python train.py --input-size 3 224 224 --crop-pct=0.875 --data_dir=$DATA_PATH --model $MODEL --amp --weight-decay ${WD} --drop-path ${DR} --batch-size $BS --tag $EXP --lr $LR

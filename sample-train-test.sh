#export TMPDIR=/mnt/t5x/temp
export ACCELERATOR_TYPE=$(curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/accelerator-type -H "Metadata-Flavor: Google")
export FLAX_PROFILE=1
export MODEL_DIR="gs://sivaibhav-exp/t5x/t5x-models/benchmark/${ACCELERATOR_TYPE}-${EXP_PREFIX:=scale}"
python3 t5x/train.py \
  --gin_search_paths=/home/sivaibhav/t5x \
  --gin_file=/home/sivaibhav/t5x/t5x/configs/runs/pretrain.gin \
  --gin_file=./t5x/examples/t5/t5_1_1/small.gin \
  --gin.MIXTURE_OR_TASK_NAME="'wikipedia_20190301.en_v003_unsupervised'" \
  --gin.MIXTURE_OR_TASK_MODULE="'t5.data.tasks'" \
  --gin.MODEL_DIR="'${MODEL_DIR}'" \
  --gin.TASK_FEATURE_LENGTHS="{'inputs': 128, 'targets': 64}" \
  --gin.TRAIN_STEPS=5_500 \
  --gin.DROPOUT_RATE=0.1 \
  --alsologtostderr \


  #--tfds_data_dir=gs://tfds-data/datasets

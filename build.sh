 export USER=sivaibhav
 export PROJECT_NAME=tpu-vm-gke-testing
 export REPO_NAME=sivaibhav-exp
 export IMAGE_NAME=t5x-test 
 export TAG=test1
 export TPU_NAME=tpu-v4-128
 export ZONE=us-central2-b
 
 docker build -t $IMAGE_NAME  .
 docker tag $IMAGE_NAME gcr.io/$PROJECT_NAME/$REPO_NAME/$IMAGE_NAME:$TAG
 docker push gcr.io/$PROJECT_NAME/$REPO_NAME/$IMAGE_NAME:$TAG

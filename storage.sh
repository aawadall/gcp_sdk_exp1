BUCKET_NAME=gs://aawadall-gcp-sdk-exp1
IMAGE_PATH=./images/AAWADALLAH.jpg
gsutil rb $BUCKET_NAME
gsutil mb -l US $BUCKET_NAME
gsutil cp $IMAGE_PATH \
    $BUCKET_NAME
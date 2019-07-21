#Variables
VM_INSTANCE=bloghost
ZONE=us-central1-a 
INSTANCE_NAME=aawadall-gcp-sdk-exp1-blog-db

# Get VM IP
EXT_IP=` gcloud compute instances describe $VM_INSTANCE --zone=$ZONE| grep natIP|awk '{print $2}'`
echo "VM IP = [$EXT_IP]"

# Authorize IP
gcloud sql instances patch $INSTANCE_NAME --authorized-networks=$EXT_IP --quiet
# Variables
INSTANCE_NAME=aawadall-gcp-sdk-exp1-blog-db
ROOT_USER=root
ROOT_PASSWORD=simplesimple # I know, this is for testing
ZONE=us-central1-a
DATABASE_VERSION=MYSQL_5_7
TIER=D4
# Delete Existing instance 
gcloud sql instances delete $INSTANCE_NAME --quiet

gcloud sql instances list
sleep 10 
# Create Instance
gcloud sql instances create $INSTANCE_NAME \
    --zone $ZONE \
    --tier $TIER 

gcloud sql instances list
sleep 10 


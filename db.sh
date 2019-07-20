# Variables
INSTANCE_NAME=blog-db
ROOT_PASSWORD=simplesimple # I know, this is for testing
ZONE=us-central1-a
DATABASE_VERSION=MYSQL_5_7
TIER=db-f1-micro
# Delete Existing instance 
gcloud sql instances delete $INSTANCE_NAME --quiet

# Create Instance
gcloud sql instances create $INSTANCE_NAME \
    --zone=$ZONE \
    --tier=$TIER 
# Create Database 
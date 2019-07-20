# Variables
INSTANCE_NAME=aawadall-gcp-sdk-exp1-blog-db
ROOT_USER=root
ROOT_PASSWORD=simplesimple # I know, this is for testing
ZONE=us-central1-a
DATABASE_VERSION=MYSQL_5_7
TIER=D4

DB_USER=blogdbuser
PASSWORD=simplesimple

# Set Root Password
gcloud sql users set-password $ROOT_USER --host % --instance $INSTANCE_NAME --password $ROOT_PASSWORD     

# Create Blog DB User
gcloud sql users create $DB_USER --host % --password $PASSWORD --instance $INSTANCE_NAME 
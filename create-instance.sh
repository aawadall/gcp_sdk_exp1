# Create Instance
gcloud compute instances create bloghost \
    --metadata-from-file startup-script=./lamp_startup.sh \
    --zone us-central1-a \

# Enable HTTP(S)
gcloud compute instances add-tags bloghost \
    --tags http-server,https-server
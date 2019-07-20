# Discard Old Instance
gcloud compute instances delete bloghost --quiet

# Create Instance
gcloud compute instances create bloghost \
    --metadata-from-file startup-script=./lamp_startup.sh \
    --zone us-central1-a \

# Set  HTTP(S) Tags
gcloud compute instances add-tags bloghost \
    --tags http-server,https-server

# HTTP Firewall Rules 
gcloud compute firewall-rules delete allow-http --quiet
gcloud compute firewall-rules create allow-http \
    --allow = tcp:80 \
    --description = Allow HTTP Traffic \
    --direction = IN \
    --target-tags = http-server

# HTTPS Firewall Rules 
gcloud compute firewall-rules delete allow-https --quiet
gcloud compute firewall-rules create allow-https \
    --allow = tcp:443 \
    --description = Allow HTTPS Traffic \
    --direction = IN \
    --target-tags = https-server

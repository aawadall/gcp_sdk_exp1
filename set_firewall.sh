# HTTP Firewall Rules 
gcloud compute firewall-rules delete allow-http --quiet
gcloud compute firewall-rules create allow-http \
    --action allow \
    --rules tcp:80 \
    --direction IN \
    --target-tags http-server

# HTTPS Firewall Rules 
gcloud compute firewall-rules delete allow-https --quiet
gcloud compute firewall-rules create allow-https \
    --allow tcp:443 \
    --direction IN \
    --target-tags https-server

# gcp_sdk_exp1
Experimenting with GCP SDK

## Task
_To create compute instance **bloghost** as a simple **LAMP** Server_

### Step 1 - Create VM
Delete existing VM with same name

```
gcloud compute instances delete bloghost --quiet
```

Create New Instance 
```
gcloud compute instances create bloghost \
    --metadata-from-file startup-script=./lamp_startup.sh \
    --zone us-central1-a \
```
### Step 2 - Setup Firewall Rules

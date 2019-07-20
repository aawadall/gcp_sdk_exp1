# gcp_sdk_exp1
Experimenting with GCP SDK

## Task
_To create compute instance **bloghost** as a simple **LAMP** Server_

### Step 1 - Create VM
#### Delete existing VM with same name

```bash
gcloud compute instances delete bloghost --quiet
```

#### Create New Instance 

```bash
gcloud compute instances create bloghost \
    --metadata-from-file startup-script=./lamp_startup.sh \
    --zone us-central1-a \
```

#### Set  HTTP(S) Tags

```
gcloud compute instances add-tags bloghost \
    --tags http-server,https-server
```

### Step 2 - Setup Firewall Rules
#### Delete Existing Rules 

```
gcloud compute firewall-rules delete allow-http --quiet
```

```
gcloud compute firewall-rules delete allow-https --quiet
```

#### Cerate New Firewall Rules 

```
gcloud compute firewall-rules create allow-http \
    --action allow \
    --rules tcp:80 \
    --direction IN \
    --target-tags http-server
```

```bash
gcloud compute firewall-rules create allow-https \
    --allow tcp:443 \
    --direction IN \
    --target-tags https-server
    ```    
# gcp_sdk_exp1
Experimenting with GCP SDK

## Task
_To create compute instance **bloghost** as a simple **LAMP** Server_

### Step 1 - Create VM
#### Delete existing VM with same name

```shell
gcloud compute instances delete bloghost --quiet
```

#### Create New Instance 

```shell
gcloud compute instances create bloghost \
    --metadata-from-file startup-script=./lamp_startup.sh \
    --zone us-central1-a \
```

#### Set  HTTP(S) Tags

```shell
gcloud compute instances add-tags bloghost \
    --tags http-server,https-server
```

### Step 2 - Setup Firewall Rules
#### Delete Existing Rules 

```shell
gcloud compute firewall-rules delete allow-http --quiet
```

```shell
gcloud compute firewall-rules delete allow-https --quiet
```

#### Cerate New Firewall Rules 

```shell
gcloud compute firewall-rules create allow-http \
    --allow tcp:80 \
    --description = Allow HTTP Traffic \
    --direction = IN \
    --target-tags = http-server
```

```shell
gcloud compute firewall-rules create allow-https \
    --allow tcp:443 \
    --description = Allow HTTPS Traffic \
    --direction = IN \
    --target-tags = https-server
```    
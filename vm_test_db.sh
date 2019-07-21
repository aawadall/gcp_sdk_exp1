#Variables
VM_INSTANCE=bloghost
ZONE=us-central1-a 
INSTANCE_NAME=aawadall-gcp-sdk-exp1-blog-db
BUCKET_NAME=gs://aawadall-gcp-sdk-exp1
FILE_NAME=index.php
PAGE_PATH=/var/www/html
# Get VM IP
EXT_IP=` gcloud sql instances list | grep $INSTANCE_NAME |awk '{print $5}'`

# Build test page
echo "VM IP = [$EXT_IP]"

 cat <<EOF > ./$FILE_NAME
<html>
<head><title>Mock Blog Page</title></head>
<body>
<h1>Sample Blog Page</h1>
<?php
\$dbserver = "$EXT_IP";
\$dbuser = "blogdbuser";
\$dbpassword = "simplesimple";

\$conn = new mysqli(\$dbserver, \$dbuser, \$dbpassword);

// Check connection
if (\$conn->connect_error) {
    die("Connection failed: " . \$conn->connect_error);
} else {
echo "Connected successfully";
} 
?>
</body></html>
EOF

# Upload to storage 
gsutil cp ./$FILE_NAME $BUCKET_NAME

gcloud compute ssh $VM_INSTANCE --command "sudo gsutil cp  $BUCKET_NAME/$FILE_NAME $PAGE_PATH/$FILE_NAME" --quiet
gcloud compute ssh $VM_INSTANCE --command "sudo service apache2 restart" --quiet

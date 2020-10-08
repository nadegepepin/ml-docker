export IMG=`docker images -q 190146978412.dkr.ecr.us-east-2.amazonaws.com/capstone-prototype:latest`
echo $IMG

for i in {0..30}
do
    echo "Job $i "
    start=$(( 100000*i))
    echo "Start $start index"
    aws sagemaker create-processing-job \
--processing-job-name image-extract-$IMG-$i \
--processing-inputs '[ {   "InputName": "input",   "S3Input": { "S3Uri": "s3://sagemaker-studio-3fqzdvw0h4y/capstone-prototype/rawdata", "LocalPath": "/opt/ml/processing/data/rawdata", "S3DataType": "S3Prefix", "S3InputMode": "File", "S3DataDistributionType": "FullyReplicated", "S3CompressionType": "None"   } }  ]' \
--processing-resources '{ "ClusterConfig": {   "InstanceCount": 1,   "InstanceType": "ml.t3.medium",   "VolumeSizeInGB": 25 }  }' \
--stopping-condition MaxRuntimeInSeconds=72000 \
--app-specification ImageUri=190146978412.dkr.ecr.us-east-2.amazonaws.com/capstone-prototype:latest,ContainerEntrypoint='[python, loader.py]',ContainerArguments="[img/train,'224,224',$start,100000]" \
--role-arn 'arn:aws:iam::190146978412:role/service-role/AmazonSageMaker-ExecutionRole-20200911T225139' \
--processing-output-config "{ \"Outputs\": [   { \"OutputName\": \"output\", \"S3Output\": {   \"S3Uri\": \"s3://sagemaker-studio-3fqzdvw0h4y/capstone-prototype/data/img/$i\",   \"LocalPath\": \"/opt/ml/processing/data/img\",   \"S3UploadMode\": \"EndOfJob\" }   } ]  }"


done

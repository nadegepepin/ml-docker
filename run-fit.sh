export IMG=`docker images -q 190146978412.dkr.ecr.us-east-2.amazonaws.com/capstone-prototype:latest`
echo $IMG

aws sagemaker create-processing-job \
--processing-job-name fit-$IMG \
--processing-inputs '[ {   "InputName": "input",   "S3Input": { "S3Uri": "s3://sagemaker-studio-3fqzdvw0h4y/capstone-prototype/data/features", "LocalPath": "/opt/ml/processing/data/features", "S3DataType": "S3Prefix", "S3InputMode": "File", "S3DataDistributionType": "FullyReplicated", "S3CompressionType": "None"   } }  ,{   "InputName": "checkpoint",   "S3Input": { "S3Uri": "s3://sagemaker-studio-3fqzdvw0h4y/capstone-prototype/data/checkpoints/", "LocalPath": "/opt/ml/processing/data/checkpoints/", "S3DataType": "S3Prefix", "S3InputMode": "File", "S3DataDistributionType": "FullyReplicated", "S3CompressionType": "None"   } }  ]' \
--processing-resources '{ "ClusterConfig": {   "InstanceCount": 1,   "InstanceType": "ml.c5.xlarge",   "VolumeSizeInGB": 50 }  }' \
--stopping-condition MaxRuntimeInSeconds=86400 \
--app-specification ImageUri=190146978412.dkr.ecr.us-east-2.amazonaws.com/capstone-prototype:latest,ContainerEntrypoint="[python, train.py]",ContainerArguments="[features/resnet_train, 32, 5, 232, 1000, 0]" \
--role-arn 'arn:aws:iam::190146978412:role/service-role/AmazonSageMaker-ExecutionRole-20200911T225139' \
--processing-output-config '{ "Outputs": [   { "OutputName": "output", "S3Output": {   "S3Uri": "s3://sagemaker-studio-3fqzdvw0h4y/capstone-prototype/models",   "LocalPath": "/opt/ml/processing/models",   "S3UploadMode": "Continuous" }   } ]  }'





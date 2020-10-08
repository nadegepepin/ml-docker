export IMG=`docker images -q 190146978412.dkr.ecr.us-east-2.amazonaws.com/capstone-prototype:latest`
echo $IMG


for i in {13..27}
do
    echo "Job $i "
    start=$(( 100000*i))
    echo "Start $start index"
    aws sagemaker stop-processing-job  --processing-job-name image-extract-$IMG-$i  

done

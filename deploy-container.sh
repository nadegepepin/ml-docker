docker-compose build python-cli
docker-compose build capstone-runtime
docker image rm 190146978412.dkr.ecr.us-east-2.amazonaws.com/capstone-prototype:latest
docker tag ml-docker_capstone-runtime:latest 190146978412.dkr.ecr.us-east-2.amazonaws.com/capstone-prototype:latest
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 190146978412.dkr.ecr.us-east-2.amazonaws.com
docker push 190146978412.dkr.ecr.us-east-2.amazonaws.com/capstone-prototype:latest

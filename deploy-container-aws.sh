export DOCKER_BUILDKIT=1 
export COMPOSE_DOCKER_CLI_BUILD=1

docker-compose build python-cli
docker-compose build capstone-runtime
# Tag and push on AWS
docker tag ml-docker_capstone-runtime:latest 190146978412.dkr.ecr.us-east-2.amazonaws.com/capstone-prototype:runtime
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 190146978412.dkr.ecr.us-east-2.amazonaws.com
docker push 190146978412.dkr.ecr.us-east-2.amazonaws.com/capstone-prototype:runtime

docker tag ml-docker_capstone-runtime:latest npepin/capstone-prototype:runtime
docker push npepin/capstone-prototype:runtime


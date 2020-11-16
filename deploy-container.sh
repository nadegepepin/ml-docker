docker-compose build python-cli
docker-compose build capstone-runtime

# Tag and push on Dockerhub
docker tag ml-docker_capstone-runtime:latest npepin/capstone-prototype:d
docker push npepin/capstone-prototype:d

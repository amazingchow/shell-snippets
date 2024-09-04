# To remove all images.
sudo docker rmi -f $(sudo docker images -aq)
# To remove all unused images, not just dangling ones.
sudo docker image prune -a
# To remove all containers.
sudo docker rm -f $(sudo docker ps -aq)
# To remove all "Exited" containers.
sudo docker ps -a | grep Exited | cut -d ' ' -f 1 | xargs sudo docker rm
# To display information regarding the amount of disk space used by the docker daemon.
sudo docker system df
sudo docker system df --verbose
# To remove build cache.
sudo docker builder prune
# To get all containers created by compose.
sudo docker container ls --filter label=com.docker.compose.project
# To get all containers, and show specific columns as output.
sudo docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"
# To get all labels of one container.
sudo docker inspect -f '{{ range $k, $v := .Config.Labels -}} {{ $k }}={{ $v }}; {{ end -}}' $CONTAINER_ID
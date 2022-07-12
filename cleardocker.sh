# get all values
echo "Write image id: "
read IMAGE_ID

# do work
IFS=$'\n'
for CONTAINER_INFO in $(docker ps -a | grep $IMAGE_ID)
do
  CONTAINER_ID=$(echo $CONTAINER_INFO | awk '{print $1}')
  echo "Deleting container $CONTAINER_ID"
  docker stop $CONTAINER_ID > /dev/null
  docker rm $CONTAINER_ID > /dev/null
done

echo "Deleting image $IMAGE_ID"
docker rmi $IMAGE_ID > /dev/null

# just check
docker images | grep $IMAGE_ID
docker ps -a | grep $IMAGE_ID
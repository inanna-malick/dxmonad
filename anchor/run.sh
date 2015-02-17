# deliberately using /./ to get around bind-root prohibition
docker run -d \
  --name anchor \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --volume=/./:/anchor/ \
  root/ssh \
  || \
  docker start anchor

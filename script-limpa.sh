# Pega todos os containers
CONTAINERS=$(docker ps -aq)

# Para todos os container
if [ -n "$CONTAINERS" ]; then
    docker stop $CONTAINERS
fi

# Excluir todos os container
if [ -n "$CONTAINERS" ]; then
    docker rm -f $CONTAINERS
fi

# Pega todas as images
IMAGES=$(docker images -aq)

# Excluir todas as images
if [ -n "$IMAGES" ]; then
    docker rmi $IMAGES
fi

# Remover referências ao contêiner do Cache:
sudo docker system prune -af

# Caso as images não tenhão sido excluidas
# Ou tenha duas images com o mesmo Id, use isso:
sudo systemctl restart docker
# Caso as images não tenhão sido excluidas,
# Reinstale o DOCKER

clear
docker images
docker ps -a

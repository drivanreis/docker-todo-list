cd docker
docker image build -t todobackend ./todo-app/back-end
docker image build -t todofrontend ./todo-app/front-end

# Eu vou deixar comentado porque não vou precisar dos testes.
#docker image build -t todotests ./todo-app/tests

# Anda não sei porque isso não deu certo!
#docker-compose up -d

# Substitui por isso
docker run --name contBack -d -p 3001:3001 todobackend
docker run --name contFron -d -p 3000:3000 todofrontend

clear
docker image
docker ps -a


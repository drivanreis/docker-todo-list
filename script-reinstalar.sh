# Caso as images não tenhão sido excluidas
# Ou tenha duas images com o mesmo Id, use isso:
# sudo systemctl restart docker
# Caso as images não tenhão sido excluidas,
# Reinstale o DOCKER
#1.Desinstale versões anteriores
sudo apt-get remove docker* containerd runc

#2. Instalando as dependências iniciais
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#3. Adicionando a chave pública do repositório Docker em nossa máquina
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

#4. Adicionando o repositório remoto na lista do apt
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#5. Instalando o Docker no Linux
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

#6. Adicionando seu usuário ao grupo de usuários Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

#7. Inicie o Daemon do Docker
sudo systemctl status docker
# Verificar se Active: active (running) está ativo
# Se não estiver ativo, inicie o daemon do Docker
#sudo systemctl start docker
sudo systemctl enable docker
#sudo systemctl disable docker

docker run hello-world

# Se tudo mais dê errado. Recrie as images
docker-compose build
# tente apagar com sudo docker system prune -af

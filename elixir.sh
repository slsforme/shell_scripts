sudo apt install -y ca-certificates curl gnupg lsb-release 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER

newgrp docker

mkdir elixir && cd elixir

wget https://files.elixir.finance/validator.env

nano validator.env

# Данные для заполнения: 
# STRATEGY_EXECUTOR_IP_ADDRESS=IP вместо IP вставляете адрес сервера, который вам обычно кидают в письме или же дают на сайте
# STRATEGY_EXECUTOR_DISPLAY_NAME=NAME тут пишем имя вашего валидатора (например: slforme)
# STRATEGY_EXECUTOR_BENEFICIARY=0x... сюда пишем адрес кошелька, на который придут реварды
# SIGNER_PRIVATE_KEY=pk... сюда вставляем ключ от тестового кошелька
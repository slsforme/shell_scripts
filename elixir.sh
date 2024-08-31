sudo apt update && sudo apt upgrade -y; sleep 2;

sudo apt install -y curl git jq lz4 build-essential unzip; sleep 2;

sudo apt install -y ca-certificates curl gnupg lsb-release; sleep 2;

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg; sleep 2;

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null; sleep 2;

sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io; sleep 2;

sudo usermod -aG docker $USER; sleep 2;

newgrp docker; sleep 2;

mkdir elixir && cd elixir; sleep 2;

wget https://files.elixir.finance/validator.env; sleep 2;

nano validator.env; sleep 2;

# Данные для заполнения: 
# STRATEGY_EXECUTOR_IP_ADDRESS=IP вместо IP вставляете адрес сервера, который вам обычно кидают в письме или же дают на сайте
# STRATEGY_EXECUTOR_DISPLAY_NAME=NAME тут пишем имя вашего валидатора (например: slforme)
# STRATEGY_EXECUTOR_BENEFICIARY=0x... сюда пишем адрес кошелька, на который придут реварды
# SIGNER_PRIVATE_KEY=pk... сюда вставляем ключ от тестового кошелька

# После заполнения данных нажимаем CTRL + O - сохраняем все изменения, и потом нажимаем CTRL + X для выхода из nano.

# Далее раним это:

docker pull elixirprotocol/validator:v3; sleep 2;

docker run -d --env-file /root/elixir/validator.env --name elixir --platform linux/amd64 elixirprotocol/validator:v3; sleep 2;
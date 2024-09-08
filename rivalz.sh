sudo apt-get update && sudo apt-get upgrade -y; sleep 1;
sudo apt install -y curl; sleep 1;
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -; sleep 1;
sudo apt install -y nodejs; sleep 1;
apt-get install screen -y; sleep 1;
screen -S rivalz; sleep 1;
sudo npm i -g rivalz-node-cli; sleep 1;
rivalz run; # тут вставляем кошелёк, который подключали на сайте.

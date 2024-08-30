wget https://github.com/fractal-bitcoin/fractald-release/releases/download/v0.1.8/fractald-0.1.8-x86_64-linux-gnu.tar.gz; sleep 2;
tar -zxvf fractald-0.1.8-x86_64-linux-gnu.tar.gz; sleep 2;
cd fractald-0.1.8-x86_64-linux-gnu/; sleep 2;
mkdir data; sleep 2;
cp ./bitcoin.conf ./data; sleep 2;

sudo tee /etc/systemd/system/fractald.service > /dev/null << EOF
[Unit]
Description=Fractal Node
After=network-online.target
[Service]
User=$USER
ExecStart=/root/fractald-0.1.8-x86_64-linux-gnu/bin/bitcoind -datadir=/root/fractald-0.1.8-x86_64-linux-gnu/data/ -maxtipage=504576000
Restart=always
RestartSec=5
LimitNOFILE=infinity
[Install]
WantedBy=multi-user.target
EOF
sleep 2;

cd bin; sleep 2;
./bitcoin-wallet -wallet=wallet -legacy create; sleep 2;

cd /root/fractald-0.1.8-x86_64-linux-gnu/bin; sleep 2;
./bitcoin-wallet -wallet=/root/.bitcoin/wallets/wallet/wallet.dat -dumpfile=/root/.bitcoin/wallets/wallet/MyPK.dat dump; sleep 2;

cd && awk -F 'checksum,' '/checksum/ {print "Wallet Private Key:" $2}' .bitcoin/wallets/wallet/MyPK.dat; sleep 10;

sudo systemctl daemon-reload;
sudo systemctl enable fractald;
sudo systemctl start fractald;

sudo journalctl -u fractald -f --no-hostname -o cat; 


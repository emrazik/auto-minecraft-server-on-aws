#!/bin/bash
sudo rpm --import https://yum.corretto.aws/corretto.key
sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
sudo yum install -y java-16-amazon-corretto-devel
cd /etc/systemd/system
echo -e "[Unit] Description=Minecraft Server\n[Service] WorkingDirectory=/opt/minecraft/server ReadWriteDirectories=/opt/minecraft/server\nExecStart=/usr/bin/java -Xmx1024M -Xms1024M -jar server.jar nogui\n[Install] WantedBy=multi-user.target" | sed 's/\r$//' > minecraft.service
chmod 664 minecraft.service
systemctl daemon-reload
sudo systemctl enable minecraft
sudo adduser minecraft
sudo mkdir /opt/minecraft/
sudo mkdir /opt/minecraft/server/ 
cd /opt/minecraft/server
sudo wget https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar
sudo chown -R minecraft:minecraft /opt/minecraft/
sudo su minecraft
cd /opt/minecraft/server
java -Xmx1024M -Xms1G -jar server.jar nogui
sed -i 's/eula=false/eula=true/' eula.txt
java -Xmx1024M -Xms1G -jar server.jar nogui




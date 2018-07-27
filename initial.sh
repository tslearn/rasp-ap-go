#!/usr/bin/env bash

echo "deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ stretch main contrib non-free rpi" > /etc/apt/sources.list
echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ stretch main contrib non-free rpi" >> /etc/apt/sources.list
echo "deb http://mirror.tuna.tsinghua.edu.cn/raspberrypi/ stretch main ui" > /etc/apt/sources.list.d/raspi.list
echo "deb-src http://mirror.tuna.tsinghua.edu.cn/raspberrypi/ stretch main ui" >> /etc/apt/sources.list.d/raspi.list
apt-get update

VERSION=1.10.3

sudo rm -rf /opt/golang
sudo mkdir -p /opt/golang/${VERSION}
sudo mkdir -p /workspace/go/src /workspace/go/pkg /workspace/go/bin

sudo chmod 777 /opt/golang/${VERSION}
sudo chmod 777 /workspace/go/src /workspace/go/pkg /workspace/go/bin

cd /opt/go/${VERSION}

wget http://mirrors.ustc.edu.cn/golang/go${VERSION}.linux-armv6l.tar.gz
sudo tar -xzf go${VERSION}.linux-armv6l.tar.gz -C /opt/golang/${VERSION}
rm -rf go${VERSION}.linux-armv6l.tar.gz

sudo rm -rf /etc/profile.d/golang.sh
sudo touch /etc/profile.d/golang.sh
sudo chmod 777 /etc/profile.d/golang.sh
sudo echo "#!/usr/bin/env bash" >> /etc/profile.d/golang.sh
sudo echo 'export GOPATH="/workspace/go"' >> /etc/profile.d/golang.sh
sudo echo 'export GOROOT="/opt/golang/'${VERSION}'/go"' >> /etc/profile.d/golang.sh
sudo echo 'export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"' >> /etc/profile.d/golang.sh

apt install -y git
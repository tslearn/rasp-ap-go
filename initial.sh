#!/usr/bin/env bash

VERSION=1.10.2

sudo rm -rf /opt/golang
sudo mkdir -p /opt/golang/${VERSION}
sudo mkdir -p /workspace/go/src /workspace/go/pkg /workspace/go/bin

sudo chmod 777 /opt/golang/${VERSION}
sudo chmod 777 /workspace/go/src /workspace/go/pkg /workspace/go/bin

cd /opt/go/${VERSION}

wget http://mirrors.ustc.edu.cn/golang/go${VERSION}.linux-armv6l.tar.gz
sudo tar -xzf go${VERSION}.linux-amd64.tar.gz -C /opt/golang/${VERSION}
rm -rf go${VERSION}.linux-amd64.tar.gz

sudo rm -rf /etc/profile.d/golang.sh
sudo touch /etc/profile.d/golang.sh
sudo chmod 777 /etc/profile.d/golang.sh
sudo echo "#!/usr/bin/env bash" >> /etc/profile.d/golang.sh
sudo echo 'export GOPATH="/workspace/go"' >> /etc/profile.d/golang.sh
sudo echo 'export GOROOT="/opt/golang/'${VERSION}'/go"' >> /etc/profile.d/golang.sh
sudo echo 'export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"' >> /etc/profile.d/golang.sh
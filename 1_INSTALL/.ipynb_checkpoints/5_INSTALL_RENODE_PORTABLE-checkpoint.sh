sudo apt update -y
sudo apt upgrade -y
sudo apt install -y policykit-1 libgtk2.0-0 screen uml-utilities gtk-sharp2 libc6-dev libicu-dev gcc python3 python3-pip
mkdir -p renode_portable
cd renode_portable
wget -O renode-latest.linux-portable.tar.gz https://builds.renode.io/renode-latest.linux-portable.tar.gz
tar xf renode-latest.linux-portable.tar.gz --strip-components=1
echo "alias renode='$(pwd)/renode'" >> ~/.bashrc
source ~/.bashrc
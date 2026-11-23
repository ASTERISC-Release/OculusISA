sudo apt update -y
sudo apt upgrade -y
sudo apt install -y git automake cmake autoconf libtool g++ coreutils policykit-1 libgtk-3-dev uml-utilities gtk-sharp3 python3 python3-pip dotnet-sdk-10.0
git clone https://github.com/renode/renode.git
cd renode
./build.sh
echo "alias renode='$(pwd)/renode'" >> ~/.bashrc
source ~/.bashrc
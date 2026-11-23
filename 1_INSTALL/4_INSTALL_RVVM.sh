sudo apt update -y
sudo apt upgrade -y
git clone https://github.com/LekKit/RVVM
cd RVVM
make -j$(nproc)
echo "alias rvvm='$(pwd)/release.linux.x86_64/rvvm_x86_64'" >> ~/.bashrc
source ~/.bashrc
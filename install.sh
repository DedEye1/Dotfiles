chmod +x script/*
./script/pacman.sh
./script/yay.sh
python script/dotfiles.py
sudo systemctl enable sddm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
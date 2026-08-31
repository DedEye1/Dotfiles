chmod +x script/*
./script/pacman.sh
./script/yay.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
python script/dotfiles.py
sudo systemctl enable sddm
echo 'Setup is done. Reboot is recommended'
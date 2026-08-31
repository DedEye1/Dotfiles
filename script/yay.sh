yay --version

if [ $? -eq 0 ]; then
    DATA="$DOTFILES/script-data"/*

    for file in $DATA; do
        filename=$(basename "$file")
        
        if [[ "$filename" == "yay.txt" ]]; then
            yay -S --needed - < "$file"
        fi
    done 
else
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
fi
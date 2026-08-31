DATA="$HOME/dotfiles/script-data"/*

for file in $DATA; do
    filename=$(basename "$file")
    
    if [[ "$filename" != "yay.txt" && "$filename" != "urls.txt" ]]; then
        sudo pacman -S --needed - < "$file"
    fi
done
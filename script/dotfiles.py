import shutil
import os
from pathlib import Path


class ConfPath:
    def __init__(self, dotfile, config):
        self.dotfile = dotfile
        self.config = config

    def remove_file(self):
        shutil.rmtree(self.config, ignore_errors=True)

    def link_file(self):
        os.symlink(self.dotfile, self.config)


HOME = Path.home()
DOTFILES = HOME/"dotfiles"

CONFIG = HOME/".config"
PICTURES = HOME/"Pictures"
os.makedirs(CONFIG, exist_ok=True)
os.makedirs(PICTURES, exist_ok=True)

paths={
    'fastfetch': ConfPath(DOTFILES/'fastfetch', CONFIG/'fastfetch'),
    'kitty': ConfPath(DOTFILES/'kitty', CONFIG/'kitty'),
    'niri': ConfPath(DOTFILES/'niri', CONFIG/'niri'),
    'noctalia': ConfPath(DOTFILES/'noctalia', CONFIG/'noctalia'),
    'wallpapers': ConfPath(DOTFILES/'Wallpapers', PICTURES/'Wallpapers'),
    'zshrc': ConfPath(DOTFILES/'.zshrc', HOME/'.zshrc')
}

for entry in paths:
    paths[entry].remove_file()
    paths[entry].link_file()
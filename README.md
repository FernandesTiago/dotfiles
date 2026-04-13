# Dotfiles

i3 rice on Linux Mint 22.3 Cinnamon — Dracula theme throughout.

![wallpaper](wallpapers/wallpaper_rato.png)

## What's Included

```
.config/
├── i3/config              # i3 window manager
├── polybar/config.ini     # Status bar
├── polybar/launch.sh      # Polybar launch script
├── picom/picom.conf       # Compositor (rounded corners, opacity, shadows)
├── dunst/dunstrc          # Notifications
├── rofi/power-menu.sh     # Power menu (shutdown, reboot, suspend, lock, logout)
├── alacritty/alacritty.toml  # Terminal
├── ranger/rc.conf         # File manager
├── ranger/scope.sh        # Ranger preview script
├── ranger/colorschemes/   # Dracula theme
├── ranger/plugins/        # Devicons
wallpapers/                # Wallpaper(s)
```

## Screenshots

![desktop](screenshots/desktop.png)
![fastfetch](screenshots/fastfetch.png)
![tiling](screenshots/tiling.png)

## Dependencies

### Core (i3 setup)

```
sudo apt install i3 polybar picom dunst rofi alacritty feh brightnessctl playerctl scrot flameshot ranger highlight atool w3m mediainfo poppler-utils xdotool blueman lxappearance pavucontrol imagemagick bc x11-utils cava
```

### Pip packages

```
pip install autotiling ueberzug --break-system-packages
```

### Manual installs

- **JetBrainsMono Nerd Font** — download from [nerdfonts.com](https://www.nerdfonts.com/font-downloads), extract to `~/.local/share/fonts/`, run `fc-cache -fv`
- **greenclip** — download binary from [GitHub releases](https://github.com/erebe/greenclip/releases) to `~/.local/bin/`
- **i3lock-color** — compile from [source](https://github.com/Raymo111/i3lock-color) (requires `libgif-dev`)
- **betterlockscreen** — install via `wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | bash -s user`, then cache wallpaper with `betterlockscreen -u wallpapers/wallpaper_rato.png`

### Apps

```
sudo apt install firefox bitwarden discord code zsh btop fastfetch gnome-calculator virtualbox git curl wget
```

Spotify installed via official `.deb` repo.

## Installation

1. Clone the repo:
   ```
   git clone https://github.com/fernandestiago/dotfiles.git ~/Github/dotfiles
   ```

2. Install dependencies (see above).

3. Symlink or copy configs:
   ```
   cp -r ~/Github/dotfiles/.config/* ~/.config/
   cp ~/Github/dotfiles/wallpapers/* ~/Pictures/Wallpaper/
   ```

4. Cache lock screen wallpaper:
   ```
   betterlockscreen -u ~/Pictures/Wallpaper/wallpaper_rato.png
   ```

5. Reload i3: `Super+Shift+R`

## Keybinds

| Key | Action |
|-----|--------|
| Super+Return | Terminal (Alacritty) |
| Super+D | Rofi launcher |
| Super+F | Firefox |
| Super+E | Nemo |
| Super+R | Ranger |
| Super+A | Pavucontrol |
| Super+P | Power menu |
| Super+C | Clipboard history (Greenclip) |
| Super+L | Lock screen |
| Super+Shift+Q | Close window |
| F11 | Fullscreen |
| Super+Shift+F | Float toggle |
| Super+Arrows | Move focus |
| Super+Ctrl+Arrows | Move window |
| Super+S/W/T | Stack/Tab/Split layout |
| Print | Flameshot |
| Alt+Shift | Toggle keyboard US/BR |

## Hardware

- HP Victus — Ryzen 7 5800H, RTX 3050 Ti
- Linux Mint 22.3 Cinnamon + i3wm

## Notes

- Volume controlled via `wpctl` (PipeWire native) with 150% limit
- Brightness via `brightnessctl` (user must be in `video` group)
- Keyboard layout toggle configured in `/etc/default/keyboard` and i3 config
- Plymouth boot theme installed separately (Laptop Glitch theme)
- Login screen uses slick-greeter with Dracula-ish theme

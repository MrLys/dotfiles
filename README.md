# Dotfiles
These are mostly outdated and definitely need some cleaning up.

# Vim
* Install neovim
* Install python 3+
* `pip install neovim`
* Run these:
  * `cp -R ~/.config/nvim ~/.config/nvim_backup` - Make a backup of you ~/.config/nvim folder
  * `cp -R .config/nvim ~/.config/` - Copy dotfiles/.config/nvim into ~/.config
* Or this:
  * `./install_vim.sh`

# Trouble with f-keys and fn lock?
```
If it works you can change this permanently (per the linked wiki page):

echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
sudo reboot # optional
```


# CopyQ
* `sudo apt install copyq`
* add the following script to a scrint commandy in copyq.
```global.copyadd = function(content) {
copy(content)
add(content)
}
```
* 


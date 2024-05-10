# Dotfiles
These are mostly outdated and definitely need some cleaning up.

# Trouble with f-keys and fn lock?
```
If it works you can change this permanently (per the linked wiki page):

echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
sudo reboot # optional
```


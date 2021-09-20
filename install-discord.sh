

# this is not a real installer, it just fixed discord and potentially other electron apps for debian 11


dpkg-deb -R ./discord-0.0.15.deb /tmp/discord-deb && sed -i 's/libappindicator1/libayatana-appindicator1/g' /tmp/discord-deb/DEBIAN/control && dpkg-deb -b /tmp/discord-deb discord-fixed.deb
sudo apt install ./discord-0.0.15.deb

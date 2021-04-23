if [ -z "$(ls -A /sys/class/power_supply)" ]; then
   IDLESEC="30min"
   HIBERNATE="120min"
else
   IDLESEC="10min"
   HIBERNATE="60min"
fi


sudo sed -i "s/#HibernateDelaySec=.\+$/HibernateDelaySec=$HIBERNATE/" /etc/systemd/sleep.conf

sudo sed -i "s/#IdleAction=.\+$/IdleAction=suspend-then-hibernate/" /etc/systemd/logind.conf
sudo sed -i "s/#IdleActionSec=.\+$/IdleActionSec=$IDLESEC/" /etc/systemd/logind.conf

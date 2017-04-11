sudo cp -r -v ./fullRomList /home/pi/dev

sudo chmod -R 755 /home/pi/dev/fullRomList
sudo chgrp -R -v pi /home/pi/dev/fullRomList
sudo chown -R -v pi /home/pi/dev/fullRomList

sudo cp -r -v ./emulators /opt/retropie/configs/all/attractmode

sudo chmod -R 755 /opt/retropie/configs/all/attractmode/emulators
sudo chgrp -R -v pi /opt/retropie/configs/all/attractmode/emulators
sudo chown -R -v pi /opt/retropie/configs/all/attractmode/emulators

sudo cp ./createRomList /home/pi/dev/
sudo chmod 755 /home/pi/dev/createRomList 
sudo chgrp -v pi /home/pi/dev/createRomList 
sudo chown -v pi /home/pi/dev/createRomList 

#!/usr/bin/env bash
# Task 0
sudo apt-get -y update
sudo apt-get -y install nginx
sudo mkdir -p /data/ /data/web_static/ /data/web_static/releases/ /data/web_static/shared/ /data/web_static/releases/test/
sudo echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html > /dev/null
sudo rm -f -R /data/web_static/current
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
TEST="\\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n"
sudo sed -i "53i $TEST" /etc/nginx/sites-available/default
sudo service nginx restart
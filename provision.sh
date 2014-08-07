sudo apt-get update
sudo apt-get remove python-virtualenv python-setuptools
sudo apt-get install python-dev python3 python3-dev python3-psycopg2 python-psycopg2 mercurial wget
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
sudo python3 ez_setup.py
sudo python2 ez_setup.py

cd /tmp/
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
sudo python get-pip.py
pip --version
sudo cp /usr/local/bin/pip /usr/local/bin/pip-2.7
sudo rm -rf /usr/local/bin/pip
sudo python3 get-pip.py
sudo cp /usr/local/bin/pip /usr/local/bin/pip-3.2
sudo cp /usr/local/bin/pip-2.7 /usr/local/bin/pip
pip --version

sudo pip-3.2 install virtualenv wheel --upgrade
sudo pip-2.7 install virtualenv wheel --upgrade

sudo chef-solo -c $WERCKER_SOURCE_DIR/solo.rb -j $WERCKER_SOURCE_DIR/solo.json -l debug

pip --version
pip-2.7 --version
pip-3.2 --version
pip freeze
pip-3.2 freeze
phantomjs -v
virtualenv --version


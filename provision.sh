sudo apt-get update
sudo chef-solo -c $WERCKER_SOURCE_DIR/solo.rb -j $WERCKER_SOURCE_DIR/solo.json -l debug
sudo apt-get remove python-virtualenv python-setuptools python-pip
sudo apt-get install mercurial

sudo add-apt-repository -y ppa:fkrull/deadsnakes
sudo apt-get update
wget  https://bootstrap.pypa.io/ez_setup.py -O /tmp/ez_setup.py

for i in 2.6 3.2 3.3 3.4 2.7
do
  sudo apt-get -y install python$i python$i-dev
  sudo python$i /tmp/ez_setup.py
  sudo easy_install-$i pip
  sudo pip$i install virtualenv wheel
done

# install extra software for non standard python versions
for i in 2.6 2.7 3.2 3.3 3.4
do
    sudo pip$i install chardet psycopg2 pycurl
done

for i in 2.6 2.7 3.2 3.3 3.4
do
    echo "## pip freeze (for python $i):"
    pip$i freeze
done

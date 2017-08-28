GIT_DIR=~/git
CONFIG_REPO=$GIT_DIR/config
USER=camille

apt-get install software-properties-common
add-apt repository "deb http://ppa.launchpad.net/ansible/ansible/ubuntu zesty main"
apt-get update
apt-get upgrade

echo "Install python and ansible"

apt-get install python-dev python-pip
chown -R $USER:$USER ~/.cache
apt-get install ansible
pip install ansible markupsafe
chown -R $USER:$USER ~/.ansible

echo "Run ansible provisioning playbooks"

ANSIBLE_NOCOWS=1 ansible-playbook -K -c local -i localhost, packages.yml -vvv

echo "Install Sublime Text"

bash ./scripts/install-sublime.sh

echo "Install warp drive"

curl -L http://github.com/mfaerevaag/wd/raw/master/install.sh | sh

echo "Install fonts"

bash ./fonts/install.sh

echo "Install nvm"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
chown -R $USER:$USER ~/.nvm

echo "Setup symlinks"

ln -sf $CONFIG_REPO/config/ .xbindkeysrc ~/.xbindkeysrc

# Install libreoffice english dictionary

SUBL_VERSION=3126
curl -0 http://download.sublimetext.com/sublime-text_build-"$SUBL_VERSION"_amd64.deb
dpkg -i sublime-text_build-"$SUBL_VERSION"_amd64.deb
rm sublime-text_build-"$SUBL_VERSION"_amd64.ded

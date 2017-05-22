#!/bin/bash


# cleanup
rm -fr app
rm app.asar
rm -fr demo

# create asar archive
mkdir app
cp main.js app
cp package.json app
cp index.html app
cp skype.png app
node_modules/asar/bin/asar pack app app.asar
rm -fr app

cp -r node_modules/electron/dist demo
rm demo/resources/default_app.asar
cp app.asar demo/resources/

# rename electron executable
mv demo/electron demo/demo

# create debian package

# cleanup
rm -fr debian

# set umask to create files and folders with correct perms
umask 0022

mkdir -p debian/tmp/usr/share
cp -r -p demo debian/tmp/usr/share/demo

# add exec to the path
mkdir -p debian/tmp/usr/bin
echo "#!/bin/bash

SCRIPT=\$(readlink -f \"\$0\")
USR_DIR=\$(readlink -f \$(dirname \$SCRIPT)/..)

nohup \"\$USR_DIR/share/demo/demo\" > /dev/null 2>&1 &
" > debian/tmp/usr/bin/demo

chmod +x debian/tmp/usr/bin/demo

# create control file
mkdir -p debian/tmp/DEBIAN
DATE=`date -R`
echo "Source: demo
Section: non-free/net
Priority: extra
Maintainer: Emma <info@skype.net>
Homepage: http://www.skype.com

Package: demo
Architecture: i386
Description: Skype" > debian/control
echo "demo (0.1.0) extra; urgency=low

  * For changes check here.

 -- Emma <info@skype.net>  $DATE
" > debian/changelog

dpkg-gencontrol -v0.1.0
fakeroot dpkg-deb -Zxz -b debian/tmp debian
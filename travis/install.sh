#!/bin/bash
# install step in travis, but split by OS, os name is passed as first argument

# Common python requirements for all OSs
pip3 install -U pip
pip3 install -U pip setuptools pyqt5 PyInstaller requests pyqt5-sip sip 

if [ $1 = 'linux' ]; then
    # linux
    sudo apt update -q
    sudo apt upgrade -y
    sudo apt install -y python3 python3-pip python3-pyqt5 python3-pyqt5.qtquick libqt5libqgtk2 zlib1g qml-module-qtquick2 qml-module-qtquick-window2 qml-module-qtquick-layouts qml-module-qtquick-extras qml-module-qtquick-dialogs qml-module-qtquick-controls qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings
fi


if [ $1 = 'osx' ]; then
    # macos
    echo "No particular actions for osx builds"
fi


if [ $1 = 'windows' ]; then
    # windows

    # compression tool for the portable app
    sudo apt install -y p7zip-full

    # pull the docker for windows
    docker pull cdrx/pyinstaller-windows
fi

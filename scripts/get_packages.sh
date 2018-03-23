#!/bin/sh

DOCKER_MACOS="https://download.docker.com/mac/stable/Docker.dmg"
DOCKER_WIN10="https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe"
DOCKER_TOOLBOX="https://download.docker.com/win/stable/DockerToolbox.exe"
GIT_WIN="https://github.com/git-for-windows/git/releases/download/v2.16.2.windows.1/PortableGit-2.16.2-64-bit.7z.exe"
SEVENZIP_WIN="https://www.7-zip.org/a/7z1801-x64.exe"

DL_DIR="/tmp/docker-core-sprint-download"

# Create directories.
mkdir -vp ${DL_DIR}/Windows
mkdir -vp ${DL_DIR}/MacOS
mkdir -vp ${DL_DIR}/Linux
mkdir -vp ${RELEASE_DIR}/bin

# Download Docker for MacOS.
curl -#SL -o ${DL_DIR}/MacOS/Docker.dmg ${DOCKER_MACOS} || exit 1

# Download Docker for Windows and Docker ToolBox and other dependencies.
curl -#SL -o ${DL_DIR}/Windows/Docker\ for\ Windows\ Installer.exe ${DOCKER_WIN10} || exit 1
curl -#SL -o ${DL_DIR}/Windows/DockerToolbox.exe ${DOCKER_TOOLBOX} || exit 1
curl -#SL -o ${RELEASE_DIR}/bin/7za.exe ${SEVENZIP_WIN} || exit 1
curl -#SL -o ${DL_DIR}/Windows/PortableGit-2.16.2-64-bit.7z.exe ${GIT_WIN} || exit 1

# Write out some instructions for Linux users.
cat <<EOF > "${DL_DIR}/Linux/README"
You should follow the instructions to download Docker for your distribution at

   https://www.docker.com/community-edition

Please tell us how best we can distribute Docker Community Edition for Linux
users as we do for MacOS and Windows users.
EOF

# Pack the installation directories.
./travis_wait -l 1200 zip -r ${RELEASE_DIR}/docker-installers.zip ${DL_DIR}/


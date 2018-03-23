#!/bin/sh

DOCKER_MACOS="https://download.docker.com/mac/stable/Docker.dmg"
DOCKER_WIN10="https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe"
DOCKER_TOOLBOX="https://download.docker.com/win/stable/DockerToolbox.exe"
GIT_WIN="https://github.com/git-for-windows/git/releases/download/v2.16.2.windows.1/PortableGit-2.16.2-64-bit.7z.exe"
SEVENZIP_WIN="https://www.7-zip.org/a/7z1801-x64.exe"

# Create directories.
mkdir -vp ${RELEASE_DIR}/Windows
mkdir -vp ${RELEASE_DIR}/MacOS
mkdir -vp ${RELEASE_DIR}/Linux

# Download Docker for MacOS.
curl -#SL -o ${RELEASE_DIR}/MacOS/Docker.dmg ${DOCKER_MACOS} || exit 1

# Download Docker for Windows and Docker ToolBox and other dependencies.
curl -#SL -o ${RELEASE_DIR}/Windows/Docker\ for\ Windows\ Installer.exe ${DOCKER_WIN10} || exit 1
curl -#SL -o ${RELEASE_DIR}/Windows/DockerToolbox.exe ${DOCKER_TOOLBOX} || exit 1
curl -#SL -o ${RELEASE_DIR}/Windows/7za.exe ${SEVENZIP_WIN} || exit 1
curl -#SL -o ${RELEASE_DIR}/Windows/PortableGit-2.16.2-64-bit.7z.exe ${GIT_WIN} || exit 1

# Write out some instructions for Linux users.
cat <<EOF > "${RELEASE_DIR}/Linux/README"
You should follow the instructions to download Docker for your distribution at

   https://www.docker.com/community-edition

Please tell us how best we can distribute Docker Community Edition for Linux
users as we do for MacOS and Windows users.
EOF



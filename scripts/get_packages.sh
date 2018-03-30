#!/bin/sh

DOCKER_MACOS="https://download.docker.com/mac/stable/Docker.dmg"
DOCKER_WIN10="https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe"
DOCKER_TOOLBOX="https://download.docker.com/win/stable/DockerToolbox.exe"
DOCKER_LINUX="https://download.docker.com/linux/static/stable/x86_64/docker-18.03.0-ce.tgz"
GIT_WIN="https://github.com/git-for-windows/git/releases/download/v2.16.2.windows.1/PortableGit-2.16.2-64-bit.7z.exe"
SEVENZIP_WIN="https://www.7-zip.org/a/7z1801-x64.exe"

# Create directories.
mkdir -vp ${DL_DIR}/Windows
mkdir -vp ${DL_DIR}/Toolbox
mkdir -vp ${DL_DIR}/MacOS
mkdir -vp ${DL_DIR}/Linux

# Download Docker for MacOS.
curl -#SL -o ${DL_DIR}/MacOS/Docker.dmg ${DOCKER_MACOS} || exit 1

# Download Docker for Windows and Docker ToolBox and other dependencies.
curl -#SL -o ${DL_DIR}/Windows/Docker\ for\ Windows\ Installer.exe ${DOCKER_WIN10} || exit 1
curl -#SL -o ${DL_DIR}/Toolbox/DockerToolbox.exe ${DOCKER_TOOLBOX} || exit 1
curl -#SL -o ${DL_DIR}/Windows/7za.exe ${SEVENZIP_WIN} || exit 1
cp ${DL_DIR}/Windows/7za.exe ${DL_DIR}/Toolbox/7za.exe
curl -#SL -o ${DL_DIR}/Windows/PortableGit-2.16.2-64-bit.7z.exe ${GIT_WIN} || exit 1

# Download static docker for Linux.
curl -#SL -o ${DL_DIR}/Linux/docker.tgz ${DOCKER_LINUX} || exit 1

# Write out some instructions for Linux users.
cd ${DL_DIR}/Linux
tar zxf docker.tgz
tar Jcf docker.tar.xz docker/
rm docker.tgz
cd /tmp

cat <<EOF > "${DL_DIR}/Linux/README.md"
You may use the following Docker static binaries provided by Docker, or follow
the instructions at https:///www.docker.com/community-edition for your Linux
distribution. Please tell us how best we can distribute Docker Community
Edition for Linux users as we do for MacOS and Windows users.

Extract the files and copy the binary applications into /usr/bin.

    tar Jxf docker.tar.xz
    sudo cp -a docker/docker* /usr/bin/

Otherwise you should follow the instructions to download Docker for your
distribution:

   * [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
   * [Debian](https://docs.docker.com/install/linux/docker-ce/debian/)
   * [CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)

You will also need Python 3.6 installed.

   * Debian/Ubuntu: `sudo apt-get install python3.6`.
   * CentOS:
      * `sudo yum install https://centos7.iuscommunity.org/ius-release.rpm`.
      * `sudo yum install python36u`.
   * Source:
      * https://www.python.org/downloads/

EOF


# Docker for Drupal Core Sprint

Provides a set of docker containers that can be used at a Drupal Core sprint.

Based on work by [BrianGilbert](https://github.com/BrianGilbert/docksal-core-sprint).

## Getting Started

### 1. Get The Files

* ResilioSync - Find the folder/directory that was downloaded and copy its contents to your Desktop.
* USB Drive - Copy docker-core-sprint-RELEASE.zip and Docker installer related to your Operating System from the USB drive to your Desktop.

### 2. Install Docker and Other Requirements

#### Windows (Docker for Windows)

You should only use this option if you do **not** use VirtualBox because you will be unable to use VirtualBox with Hyper-V enabled.

* Run the "Docker for Windows Installer" to install Docker.
   * If your computer does not have Hyper-V support enabled, Docker will try to enable it and Windows will need to be restarted.
* Run the "Git for Windows" 64-bit installer

#### Windows (Docker ToolBox)

* Run the "Docker ToolBox" installer.

#### MacOS

* Open "Docker.dmg" file, and drag and drop the Docker application file to your Applications directory.
* Run Docker.

#### Linux

* Install the equivalent packages for Docker Community Edition from the following distributions:
   * [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
   * [Debian](https://docs.docker.com/install/linux/docker-ce/debian/)
   * [CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)
* Confirm that the docker daemon (`dockerd`) is running.
   * systemd: `sudo systemctl start docker.service`.
* Install python3:
   * Debian/Ubuntu: `sudo apt-get install python3.6`.
   * CentOS:
      * `sudo yum install https://centos7.iuscommunity.org/ius-release.rpm`.
      * `sudo yum install python36u`.

### 3. Extract docker-core-sprint directory

#### Windows:

   * Extract the docker-core-sprint-RELEASE.zip file to your Desktop. It is required to be within your user directory and not anywhere else on your file system.

### MacOS/Linux:

   * Open Terminal.app or other terminal application.
   * Extract the docker-core-sprint-RELEASE.zip file to your Desktop e.g. `unzip docker-core-sprint-0.0.1.zip`.
   * Change directory to the docker-core-sprint directory e.g. `cd docker-core-sprint`.

### 4. Install Docker Images

#### Windows (Docker for Windows)

   * Open Powershell.
   * Run `docker.exe load -i C:\Users\[your username]\Desktop\docker-core-sprint\images.tar`.

#### Windows (Docker ToolBox)

   * Open "Docker Quickstart Terminal".
   * Run `docker load -i /c/Users/[your username]/Desktop/images.tar`.

#### MacOS:

   * Open Terminal.app or other terminal application.
   * Run `docker load -i ~/Desktop/images.tar`.

#### Linux:

   * Open a terminal application.
   * Run `docker load -i /path/to/images.tar`.

### 5. Start docker containers.

#### Windows (Docker for Windows)

   * Run Powershell.
   * Change directory to the docker-core-sprint directory e.g. `cd C:\Users\[your username]\Desktop\docker-core-sprint`.
   * Run `docker-compose.exe up -d`. 

#### Windows (Docker ToolBox)

   * Run "Docker Quickstart Terminal"
      * Please note the IP Address, which is `192.168.99.100` by default but may be different on your system.
   * Change directory to the docker-core-sprint directory e.g. `cd path/to/docker-core-sprint`.
   * Run `docker-compose up -d`.

#### MacOS
   * Open Terminal.app or other terminal application.
   * Change directory to the docker-core-sprint directory e.g. `cd ~/Desktop/docker-core-sprint`.
   * Run `docker-compose up -d`.

#### Linux

   * Open terminal application.
   * Change directory to the docker-core-sprint directory e.g. `cd path/to/docker-core-sprint`.
   * Install docker-compose locally by running `make`.
   * Run `. env/bin/activate`.
   * Run `docker-compose up -d`.

### 6. Add to hosts file

#### Windows (Docker for Windows)

   * Open `C:\Windows\System32\drivers\etc\hosts` in an editor such as Notepad.
   * Add `127.0.0.1      drupal.docker.internal ide.drupal.docker.internal irc.drupal.docker.internal mail.drupal.docker.internal adminer.drupal.docker.internal`.
   * Save the file.
   * Open a Run command from the start menu.
   * Run `ipconfig /flushdns`.

#### Windows (Docker ToolBox)

   * Open `C:\Windows\System32\drivers\etc\hosts` in an editor such as Notepad.
   * Add `192.168.99.100      drupal.docker.internal ide.drupal.docker.internal irc.drupal.docker.internal mail.drupal.docker.internal adminer.drupal.docker.internal`.
   * Save the file.
   * Open a Run command from the start menu.
   * Run `ipconfig /flushdns`.

#### MacOS

   * Open Terminal.app or other terminal application.
   * Run `echo "127.0.0.1      drupal.docker.internal ide.drupal.docker.internal irc.drupal.docker.internal mail.drupal.docker.internal adminer.drupal.docker.internal" | sudo tee -a /etc/hosts > /dev/null` which tells your computer to associate the host names with your local IP address.
      * Enter your password when prompted.
   * Run `dscacheutil -flushcache` to clear your DNS cache.

#### Linux:
   * Open terminal application.
   * Run `echo "127.0.0.1      drupal.docker.internal ide.drupal.docker.internal irc.drupal.docker.internal mail.drupal.docker.internal adminer.drupal.docker.internal" | sudo tee -a /etc/hosts > /dev/null` which tells your computer to associate the host names with your local IP address.
      * Enter your password when prompted.

### 7. Visit the following in your browser

* Drupal Core development site: http://drupal.docker.internal:8000
* Chat: http://irc.drupal.docker.internal:8000
* IDE: http://ide.drupal.docker.internal:8000
* Mail: http://mail.drupal.docker.internal:8000
* Admin page: http://adminer.drupal.docker.internal:8000

## Manage Docker

### Start things

* Run `docker-compose up -d`.

### Shut things down

* Run `docker-compose stop` so that you do not lose your work later.
* Run `docker-compose down` to remove everything and start from scratch.

### Deploy code changes

* Run `docker-compose restart php` after you've made some changes such as adding a test.


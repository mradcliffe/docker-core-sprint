# Docker for Drupal Core Sprint

Provides a set of docker containers that can be used at a Drupal Core sprint.

Based on work by [BrianGilbert](https://github.com/BrianGilbert/docksal-core-sprint).

## Getting Started

### 1. Get Files

* ResilioSync - Find the folder/directory that was download.
* USB Drive - Copy folder/directory from the USB drive.

### 2. Install Docker and Other Requirements

* Windows
   * Docker:
      * Run the "Docker for Windows" **only** if you do **not** use VirtualBox and your computer has Hyper-V support enabled.
      * Run the "Docker Toolbox.exe" if you have VirtualBox installed.
   * @todo git, babun
* MacOS
   * Open "Docker.dmg" file, and drag and drop Docker application file to Applications.
   * Run Docker. Do not run any updates at the sprint to save bandwidth.
* Linux
   * Install the equivalent packages for Docker Community Edition from the following distributions:
      * [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
      * [Debian](https://docs.docker.com/install/linux/docker-ce/debian/)
      * [CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)
   * Make sure that the docker daemon is running.
   * Install python3.

### 3. Install Docker Images

* Windows:
* MacOS:
   * Open Terminal.app or other terminal application.
   * Run `gzcat ~/Desktop/images.tar.gz | docker load`.
* Linux:
   * Open a terminal application.
   * Run `gzcat path/to/images.tar.gz | docker load`.

### 4. Extract docker-core-sprint directory

* Windows:
* MacOS/Linux:
   * Open Terminal.app or other terminal application.
   * Extract the docker-core-sprint-RELEASE.tar.gz file e.g. `tar zxf docker-core-sprint-0.0.1.tar.gz`
   * Change directory to the file containing docker-core-sprint-RELEASE.tar.gz e.g. `cd docker-core-sprint`.

### 5. Start docker containers.

* Windows
* MacOS
   * Open Terminal.app or other terminal application.
   * Change directory to the docker-core-sprint directory e.g. `cd ~/Desktop/docker-core-sprint`.
   * Run `docker-compose up -d`.
* Linux:
   * Open terminal application.
   * Change directory to the docker-core-sprint directory e.g. `cd path/to/docker-core-sprint`.
   * Install docker-compose locally by running `make`.
   * Run `. env/bin/activate`.
   * Run `docker-compose up -d`.

### 6. Add to hosts file

* Windows
   * Open `C:\Windows\System32\drivers\etc\hosts` in an editor such as Notepad.
* MacOS
   * Open Terminal.app or other terminal application.
   * Run `sudo cat 127.0.0.1      drupal.docker.localhost ide.drupal.docker.localhost irc.drupal.docker.localhost mail.drupal.docker.localhost adminer.drupal.docker.localhost >> /etc/hosts` which tells your computer to associate the host names with your local IP address.
      * Enter your password when prompted.
   * Run `dscacheutil -flushcache` to clear your DNS cache.
* Linux:
   * Open terminal application.
   * Run `sudo cat 127.0.0.1      drupal.docker.localhost ide.drupal.docker.localhost irc.drupal.docker.localhost mail.drupal.docker.localhost adminer.drupal.docker.localhost >> /etc/hosts` which tells your computer to associate the host names with your local IP address.
      * Enter your password when prompted.

### 7. Visit the following in your browser

* Drupal Core development site: http://drupal.docker.localhost:8000
* Chat: http://irc.drupal.docker.localhost:8000
* IDE: http://ide.drupal.docker.localhost:8000
* Mail: http://mail.drupal.docker.localhost:8000
* Admin page: http://adminer.drupal.docker.localhost:8000

## Manage Docker

### Start things

* Run `docker-compose up -d`.

### Shut things down

* Run `docker-compose stop` so that you do not lose your work later.
* Run `docker-compose down` to remove everything and start from scratch.

### Deploy code changes

* Run `docker-compose restart php` after you've made some changes such as adding a test.


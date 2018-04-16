# Docker for Drupal Core Sprint

Provides a set of docker containers that can be used at a Drupal Core sprint.

Based on work by [BrianGilbert](https://github.com/BrianGilbert/docksal-core-sprint).

You should use a [drud/quicksprint](https://github.com/drud/quicksprint) release instead unless you are running Windows 10 or 7 without Hyper-V support (or cannot install and use Docker for Windows). This is intended as a simpler fallback option for DrupalCon sprints.

## Getting Started

1. [Get The Files](#get-the-files)
2. [Extract docker-core-sprint](#extract-files)
3. [Install Docker and Other Requirements](#install)
4. [Open Terminal](#open-terminal)
5. [Install Docker Images](#install-images)
6. [Start Docker](#start)
7. [Edit Hosts File](#edit-hosts-file)
8. [Start Sprinting](#start-contributing)

<a name="get-the-files"></a>
### 1. Get The Files

* ResilioSync - Find the folder/directory that was downloaded and copy its contents to your Desktop.
* USB Drive - Copy docker-core-sprint-RELEASE.zip from the USB drive to your Desktop and extract it.
* GitHub - Download docker-core-sprint-RELEASE.zip from https://github.com/mradcliffe/docker-core-sprint/releases

<a name="extract-files"></a>
### 2. Extract docker-core-sprint directory

   1. Extract the docker-core-sprint-linux-RELEASE.zip file to your Desktop.
   2. Browse to this directory.
   3. Unzip the docker-installers.zip file.

<a name="install"></a>
### 3. Install Docker and Other Requirements

Please read the Linux/README.md file for more details about installing docker, and do the following once you have installed docker.

* Confirm that the docker daemon (`dockerd`) is running.
   * systemd: `sudo systemctl start docker.service`.
   * or via some command such as `sudo nohup /usr/bin/unshare -m -- dockerd -p /var/run/dockerd.pid >> /var/log/dockerd.log 2>&1 &`
* Confirm that python 3.6 is installed.

<a name="open-terminal"></a>
### 4. Open Terminal/Command-Line

* Run the docker daemon. Confirm dockerd is running.
  * This is usually done using a SysV init script, Systemd command or BSD-style init script.
* Open your preferred terminal program such as xterm or Terminal.

<a name="install-images"></a>
### 5. Install Docker Images

* Change directory to the docker-core-sprint directory using the `cd` command.
   * Run `cd /path/to/your/docker-core-sprint`
* Import docker images:
   * Run `xzcat images.tar.xz | docker load`

<a name="start"></a>
### 6. Start docker containers.

Start your environment with **docker-compose**!

* Run `make` to install docker-compose.
* Run `. env/bin/activate` to enter into a Python 3 environment.
* Run `docker-compose up -d`.

<a name="edit-hosts-file"></a>
### 7. Add to hosts file

You will need to update your system hosts file so that you can connect to the sprint toolset. This file is located in the following locations according to your operating system and requires administrator access to edit.

Run `echo "127.0.0.1      drupal.docker.internal ide.drupal.docker.internal mail.drupal.docker.internal adminer.drupal.docker.internal" | sudo tee -a /etc/hosts > /dev/null`, and enter your password when prompted.

<a name="start-contributing"></a>
### 8. Visit the following in your browser

* Drupal Core development site: http://drupal.docker.internal:8000
   * Install Drupal with the database host "mariadb", and the username, password and database name as "drupal8".
* Chat: https://drupal.org/chat
   * Signup for Drupal Slack, use IRC or join https://drupalchat.eu.
* IDE: http://ide.drupal.docker.internal:8000
   * Log into the cloud9 IDE with "drupal" as the user name and password.
* Mail: http://mail.drupal.docker.internal:8000
   * Check any e-mails that are sent from the Drupal instance.
* Admin page: http://adminer.drupal.docker.internal:8000
   * Drop database tables, etc...

## Manage Docker

### Start things

* Run `docker-compose up -d`.

### Shut things down

* Run `docker-compose stop` so that you do not lose your work later.
* Run `docker-compose down` to remove everything and start from scratch.

### Deploy code changes

* Run `docker-compose restart php` after you've made some changes such as adding a test.

### Manage volumes

* List volumes with `docker volume ls`.
* Remove volumes (after `docker down`) with `docker volume rm VOLUME`.

For example, you might have to `docker volume rm dockercoresprint_web` to get
rid of an old `settings.php` if you want to install Drupal with a different
profile.

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

<a name="extract-files"></a>
### 2. Extract docker-core-sprint directory

   1. Extract the docker-core-sprint-OPERATINGSYSTEM-RELEASE.zip file to your Desktop. It is required to be within your user directory for Windows and MacOS users.
   2. Browse to this directory.
   3. Unzip the docker-installers.zip file.

<a name="install"></a>
### 3. Install Docker and Other Requirements

#### Windows (Docker for Windows)

You should only use this option if you do **not** use VirtualBox because you will be unable to use VirtualBox with Hyper-V enabled.

Find the Docker and dependency installers in the Windows directory of the extracted docker-core-sprint directory. 

* Run the "Docker for Windows Installer" to install Docker.
   * If your computer does not have Hyper-V support enabled, Docker will try to enable it and Windows will need to be restarted.
* Run the "Portable-Git" 64-bit installer.

#### Windows (Docker ToolBox)

Find the Docker and dependency installers in the Windows directory of the extracted docker-core-sprint directory. 

* Run the "Docker ToolBox" installer"

#### MacOS

* Open "Docker.dmg" file in the MacOS directory, and drag and drop the Docker application file to your Applications directory.

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


<a name="open-terminal"></a>
### 4. Open Terminal/Command-Line

#### Windows (Docker for Windows)

* Run Docker.
* Open Powershell.

#### Windows (Docker ToolBox)

* Open "Docker Quickstart Terminal".
   * Make note of the highlighted IP Address e.g. `192.168.99.100`.

#### MacOS

* Run Docker.
   * Please do not update Docker at this time.
* Open Terminal.app or your preferred terminal program.

#### Linux

* Run the docker daemon. Confirm dockerd is running.
  * This is usually done using a SysV init script, Systemd command or BSD-style init script.
* Open your preferred terminal program such as xterm or Terminal.

<a name="install-images"></a>
### 5. Install Docker Images

* Change directory to the docker-core-sprint directory using the `cd` command.
   * Examples:
      * Windows (Docker for Windows): `cd C:\Users\[your username]\Desktop\docker-core-sprint`
      * Windows (Docker ToolBox): `cd /c/Users/[your username]/Desktop/docker-core-sprint`
      * MacOS: `cd /Users/[your username]/Desktop/docker-core-sprint`
      * Linux: `cd /path/to/your/docker-core-sprint`
* Import docker images:
   * Examples:
      * Windows (Docker for Windows):
         * Run `Windows\7za x images.tar.xz`
         * Run `docker load -i images.tar` or `docker.exe load -i images.tar`.
      * Windows (Docker ToolBox):
         * Run `Windows/7za x images.tar.xz`
         * Run `docker load -i images.tar` or `docker.exe load -i images.tar`.
      * MacOS: Run `gunzip -c images.tar.xz | docker load`
      * Linux: Run `xzcat images.tar.xz | docker load`

<a name="start"></a>
### 6. Start docker containers.

Start your environment with **docker-compose**!

#### Windows/MacOS

* Run `docker-compose up -d` or `docker-compose.exe up -d`.

#### Linux

* Run `make` to install docker-compose.
* Run `. env/bin/activate` to enter into a Python 3 environment.
* Run `docker-compose up -d`.

<a name="edit-hosts-file"></a>
### 7. Add to hosts file

You will need to update your system hosts file so that you can connect to the sprint toolset. This file is located in the following locations according to your operating system and requires administrator access to edit.

#### Windows

Open your `C:\Windows\System32\drivers\etc\hosts` file in an editor such as Notepad.

* Docker for Windows: Add `127.0.0.1      drupal.docker.internal ide.drupal.docker.internal irc.drupal.docker.internal mail.drupal.docker.internal adminer.drupal.docker.internal` at the bottom of the editor and save.
* Docker Toolbox: Add `192.168.99.100      drupal.docker.internal ide.drupal.docker.internal irc.drupal.docker.internal mail.drupal.docker.internal adminer.drupal.docker.internal` at the bottom of the editor and save.

Open a "Run command" from the start menu, run `ipconfig /flushdns`, and then restart your web browser if it is open already.

#### MacOS or Linux

Run `echo "127.0.0.1      drupal.docker.internal ide.drupal.docker.internal irc.drupal.docker.internal mail.drupal.docker.internal adminer.drupal.docker.internal" | sudo tee -a /etc/hosts > /dev/null`, and enter your password when prompted.

* On MacOS only, run `dscacheutil -flushcache` and restart your web browser if it is open already.

<a name="start-contributing"></a>
### 8. Visit the following in your browser

* Drupal Core development site: http://drupal.docker.internal:8000
   * Install Drupal with the database host "mariadb", and the username, password and database name as "drupal8".
* Chat: http://irc.drupal.docker.internal:8000
   * Log into chat with fellow contributors.
   * Also visit https://drupal.slack.com, and join #contribute to chat.
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

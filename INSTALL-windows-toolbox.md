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

   1. Extract the docker-core-sprint-toolbox-RELEASE.zip file to your Desktop. It is required to be within your user directory.
   2. Browse to this directory.

<a name="install"></a>
### 3. Install Docker and Other Requirements

Find the Docker and dependency installers in the Windows directory of the extracted docker-core-sprint directory. 

* Run the "Docker ToolBox" installer.
   * If you do not already have Git, check the Git for Windows option during the install process.
* Run the "7za.exe" installer.
* Right-click the "docker-images.tar.xz" file and choose the "Extract Here" option from the "7-Zip" submenu.

<a name="open-terminal"></a>
### 4. Open Terminal/Command-Line

* Open "Docker Quickstart Terminal".
   * Make note of the highlighted IP Address e.g. `192.168.99.100`.

<a name="install-images"></a>
### 5. Install Docker Images

* Change directory to the docker-core-sprint directory using the `cd` command.
   * Run `cd /c/Users/[your username]/Desktop/docker-core-sprint`
* Import docker images:
   * Run `docker load -i images.tar` or `docker.exe load -i images.tar`.

<a name="start"></a>
### 6. Start docker containers.

Start your environment with **docker-compose**!

* Run `docker-compose up -d` or `docker-compose.exe up -d`.

<a name="edit-hosts-file"></a>
### 7. Add to hosts file

You will need to update your system hosts file so that you can connect to the sprint toolset. This file is located in the following location and requires administrator access to edit.

Open your `C:\Windows\System32\drivers\etc\hosts` file in an editor such as Notepad.

* Add `192.168.99.100      drupal.docker.internal ide.drupal.docker.internal irc.drupal.docker.internal mail.drupal.docker.internal adminer.drupal.docker.internal` at the bottom of the editor and save.

Open a "Run command" from the start menu, run `ipconfig /flushdns`, and then restart your web browser if it is open already.

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

### Manage volumes

* List volumes with `docker volume ls`.
* Remove volumes (after `docker down`) with `docker volume rm VOLUME`.

For example, you might have to `docker volume rm dockercoresprint_web` to get
rid of an old `settings.php` if you want to install Drupal with a different
profile.

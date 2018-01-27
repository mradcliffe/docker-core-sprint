# Docker for Drupal Core Sprint

Provides a set of docker containers that can be used at a Drupal Core sprint.

Based on work by [BrianGilbert](https://github.com/BrianGilbert/docksal-core-sprint).

## Getting Started

### 1. Requirements

Confirm that you have installed the following dependencies:

1. Docker
  1. Windows
     1. Docker:
        * "Docker for Windows" **only** if you do **not** use VirtualBox and your computer has Hyper-V support enabled.
        * "Docker Toolbox" if you have VirtualBox installed.
     2. Git
        * TortoiseGit
        * Git Bash
        * babun/cygwin with Git install
  2. MacOS
     1. [Docker Community Edition for Desktop Mac](https://store.docker.com/editions/community/docker-ce-desktop-mac)
     2. Git
        * XCode
        * Git for Mac
        * Homebrew
  3. Linux
     * Either get docker and docker-compose packages for your distribution or compile those from source.
     * If you do not have docker-composer, you can use the following Makefile to install it via pip automatically:
        * `make`
        * `. env/bin/activate`

### 2. Download Drupal Source

We want to download the most up-to-date source code for Drupal via Git so that we can easily edit it before running the container.

1. Clone the Drupal core project from the URL `https://git.drupal.org:/project/drupal.git` into the current working directory of this repository.
2. Make sure you checkout the current core branch that you will be working on such as 8.5.x or 8.6.x.

### 3. Start the docker environment

* Windows:
   * Docker Toolbox
      * Run the "Docker Quickstart Terminal" and browse to this directory.
          * Then run `docker-compose up`
* MacOS/Linux:
   * Browse to this directory in a terminal.
   * Then run `docker-compose up`

## Manage Docker

### Shut things down

* Run `docker-compose stop` so that you do not lose your work later.
* Run `docker-compose down` to remove everything and start from scratch.

### Refresh environment

* Run `docker-compose restart php` after you've made some changes such as adding a test.


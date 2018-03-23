# Contributing

[![Build Status](https://travis-ci.org/mradcliffe/docker-core-sprint.svg?branch=master)](https://travis-ci.org/mradcliffe/docker-core-sprint)

## Development

* Drupal code base is stored as a git submodule for development only.

### docker-drupal-php

See [mradcliffe/docker-drupal-php](https://github.com/mradcliffe/docker-drupal-php) (DockerHub:  [mradcliffe2/docker-drupal-php](https://dockerhub.com/mradcliffe2/docker-drupal-php)).

@todo move this to a different namespace or get rid of this for something else.

## Release

* Travis CI build, tag and release process:
   * Packages images with the release.
   * Changes drupal project submodule into a real repository.
   * Adds a .gitignore to drupal project for ease-of-use.
   * Creates a tarball of the release directory.
   * Pushes to GitHub.

## Packaging

* Docker Installers
   * MacOS: https://store.docker.com/editions/community/docker-ce-desktop-mac
   * Windows:
      * Docker CE: https://store.docker.com/editions/community/docker-ce-desktop-windows
      * Docker ToolBox: https://docs.docker.com/toolbox/overview/
   * Linux:
      * Need instructions for Debian and RedHat based distributions as well as instructions for more traditional and alternative Linux desktops (Linux From Scratch, Slackware, Gentoo, etc...).

### Items

docker-core-sprint-RELEASE.zip should contain the following:

* .gitignore
* .thelounge
* licenses/
* drupal/
* Windows/
   * Docker ToolBox.exe
   * Docker for Windows Installer.exe
   * 7za.exe
   * Git-2.16.1.4-64-bit.exe
* MacOS/
   * Docker.dmg
* Linux/
   * README
   * @todo What do we include here?
* COPYING
* LICENSE
* Makefile
* README.md
* requirements.txt

### ResilioSync

@todo

### USB Drives

Copy Items to Flash Drive.

@todo write up instructions with nifty imaging program that we were using to mass-update flash drives so as to avoid copying MacOS system directories.


# Contributing

@todo flush this out with implementation details

## Development

* Drupal code base is stored as a git submodule for development only.

## Release

* Travis CI build, tag and release
   * Remove submodule
   * Make it a real repo
   * Tar/Zip up the directory for release
   * Tag
   * Push to GitHub.

## Packaging

### Items

* Tar/Zip of the release of this repository.
* Docker Installers
   * MacOS: https://store.docker.com/editions/community/docker-ce-desktop-mac
   * Windows:
      * Docker CE: https://store.docker.com/editions/community/docker-ce-desktop-windows
      * Docker ToolBox: https://docs.docker.com/toolbox/overview/
   * Linux:
      * Need instructions for Debian and RedHat based distributions as well as instructions for LFS and alternative distributions
* Docker Images:
   * Save images:
      * Each image in the docker-compose.yml file needs to be saved:
         * `docker image save --output=images.tar wodby/mariadb wodby/drupal-apache wodby/adminer linuxserver/thelounge traefik hoadx/cloud9-alpine mailhog/mailhog mradcliffe2/docker-drupal-php:core-0.4`
         * `gzip images.tar`

### ResilioSync


### USB Drives



#!/bin/sh

# Fix ownership and permissions because docker.
sudo chown -R travis:travis drupal

# Remove the git submodule.
mv drupal drupal_tmp
git submodule deinit drupal
rm drupali_tmp/.git
mv .git/modules/drupal drupal_tmp/.git
rmdir drupal
mv drupal_tmp drupal

# Make sure .git is a directory or fail the build.
if [ ! -d drupal/.git ]; then
  echo -e "Failed to change git submodule into a full git repository!"
  exit 1
fi

# Make sure ownership is group-owned because docker volume ownership is a mess
# on Windows, MacOS and Linux.
chmod ug+w -R drupal
cd drupal

# Change the working tree of the git repository.
sed -i 's#\.\./\.\./\.\./drupal#..#' .git/config

# Checkout dev branch.
git config core.fileMode false
git config core.autocrlf false
git checkout 8.6.x

# Install composer libraries.
composer install --no-interaction --dev --no-suggest

cd ..


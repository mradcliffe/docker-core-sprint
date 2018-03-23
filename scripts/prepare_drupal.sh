#!/bin/sh

# Remove the git submodule.
mv drupal drupal_tmp
git submodule deinit drupal
rm drupal_tmp/.git
mv .git/modules/drupal drupal_tmp/.git
rmdir drupal
mv drupal_tmp drupal

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


#!/bin/sh

# Get miscellaneous files ready.
cp -a ${TRAVIS_BUILD_DIR}/. "${RELEASE_DIR}/"

# Copies the example.gitignore file into drupal root as .gitignore.
mv "${RELEASE_DIR}/example.gitignore" "${RELEASE_DIR}/drupal/.gitignore"

# Removes this repository's .git directory and .travis.yml only.
rm -rf "${RELEASE_DIR}/.git" "${RELEASE_DIR}/scripts"
rm "${RELEASE_DIR}/.travis.yml"


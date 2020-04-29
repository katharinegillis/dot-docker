#!/usr/bin/env bash

pkg.link() {
    fs.link_files files
}

pkg.install() {
    # Install docker
    bash $PKG_PATH/run.sh "$ELLIPSIS_SRC"
}

pkg.pull() {
    # Unlink old files
    hooks.unlink

    # Pull package changes
    git.pull

    # Link new files
    pkg.link

    # Install docker
    bash $PKG_PATH/run.sh "$ELLIPSIS_SRC"
}

pkg.uninstall() {
    # Remove docker
    bash $PKG_PATH/uninstall.sh "$ELLIPSIS_SRC"
}
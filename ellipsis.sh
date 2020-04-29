#!/usr/bin/env bash

pkg.link() {
    fs.link_files files
}

pkg.install() {
    # Install docker
    bash $PKG_PATH/run.sh "$ELLIPSIS_SRC"
}

pkg.pull() {
    # Check for updates on git
    git remote update 2>&1 > /dev/null
    if git.is_behind; then
        # Unlink old files
        hooks.unlink

        # Pull package changes
        git.pull

        # Link new files
        pkg.link
    fi

    # Install docker
    bash $PKG_PATH/run.sh "$ELLIPSIS_SRC"
}

pkg.uninstall() {
    # Remove docker
    bash $PKG_PATH/uninstall.sh "$ELLIPSIS_SRC"
}
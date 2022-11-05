#! /usr/bin/python3

# This file looks for AppImages and generates desktop entries
# for each one in order to be detected by Ulauncher on startup.
# This script sould be put in your DE autostart folder.

import os
from os.path import exists, join

# Get the home path for user
HOME = os.environ.get("HOME")
APPIMAGE_DIR = join(HOME, "Applications", "AppImages")
DESKTOP_ENTRIES_DIR = join(HOME, ".local", "share", "applications")


def generate_entry(app_name):
    short_name = app_name.split(sep="-")[0]
    desktop_file = join(DESKTOP_ENTRIES_DIR, f"{short_name}.desktop")

    if not exists(desktop_file):
        entry = (
            "[Desktop Entry]\n"
            "Type=Application\n"
            f"Name={short_name}\n"
            f"Exec={join(APPIMAGE_DIR, app_name)}\n"
        )

        # Create the file since it doesn't exist
        with open(desktop_file, "w") as f:
            f.write(entry)


if __name__ == "__main__":
    for api in os.listdir(APPIMAGE_DIR):
        generate_entry(api)

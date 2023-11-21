# Docker container for Firefox ESR
[![Release](https://img.shields.io/github/release/jlesage/docker-firefox-esr.svg?logo=github&style=for-the-badge)](https://github.com/jlesage/docker-firefox-esr/releases/latest)
[![Docker Image Size](https://img.shields.io/docker/image-size/jlesage/firefox-esr/latest?logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/firefox-esr/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/jlesage/firefox-esr?label=Pulls&logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/firefox-esr)
[![Docker Stars](https://img.shields.io/docker/stars/jlesage/firefox-esr?label=Stars&logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/firefox-esr)
[![Build Status](https://img.shields.io/github/actions/workflow/status/jlesage/docker-firefox-esr/build-image.yml?logo=github&branch=master&style=for-the-badge)](https://github.com/jlesage/docker-firefox-esr/actions/workflows/build-image.yml)
[![Source](https://img.shields.io/badge/Source-GitHub-blue?logo=github&style=for-the-badge)](https://github.com/jlesage/docker-firefox-esr)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg?style=for-the-badge)](https://paypal.me/JocelynLeSage)

This is a Docker container for [Firefox ESR](https://www.mozilla.org/en-CA/firefox/enterprise/).

The GUI of the application is accessed through a modern web browser (no
installation or configuration needed on the client side) or via any VNC client.

---

[![Firefox ESR logo](https://images.weserv.nl/?url=raw.githubusercontent.com/jlesage/docker-templates/master/jlesage/images/firefox-esr-icon.png&w=110)](https://www.mozilla.org/en-CA/firefox/enterprise/)[![Firefox ESR](https://images.placeholders.dev/?width=352&height=110&fontFamily=monospace&fontWeight=400&fontSize=52&text=Firefox%20ESR&bgColor=rgba(0,0,0,0.0)&textColor=rgba(121,121,121,1))](https://www.mozilla.org/en-CA/firefox/enterprise/)

Firefox Extended Support Release (ESR) is an official version of Firefox
developed for large organizations like universities and businesses that need to
set up and maintain Firefox on a large scale.  Firefox ESR does not come with
the latest features but it has the latest security and stability fixes.

---

## Quick Start

**NOTE**:
    The Docker command provided in this quick start is given as an example
    and parameters should be adjusted to your need.

Launch the Firefox ESR docker container with the following command:
```shell
docker run -d \
    --name=firefox-esr \
    -p 5800:5800 \
    -v /docker/appdata/firefox-esr:/config:rw \
    jlesage/firefox-esr
```

Where:

  - `/docker/appdata/firefox-esr`: This is where the application stores its configuration, states, log and any files needing persistency.

Browse to `http://your-host-ip:5800` to access the Firefox ESR GUI.

## Documentation

Full documentation is available at https://github.com/jlesage/docker-firefox-esr.

## Support or Contact

Having troubles with the container or have questions?  Please
[create a new issue].

For other great Dockerized applications, see https://jlesage.github.io/docker-apps.

[create a new issue]: https://github.com/jlesage/docker-firefox-esr/issues

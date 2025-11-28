# Docker container for Firefox ESR
[![Release](https://img.shields.io/github/release/jlesage/docker-firefox-esr.svg?logo=github&style=for-the-badge)](https://github.com/jlesage/docker-firefox-esr/releases/latest)
[![Docker Image Size](https://img.shields.io/docker/image-size/jlesage/firefox-esr/latest?logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/firefox-esr/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/jlesage/firefox-esr?label=Pulls&logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/firefox-esr)
[![Docker Stars](https://img.shields.io/docker/stars/jlesage/firefox-esr?label=Stars&logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/firefox-esr)
[![Build Status](https://img.shields.io/github/actions/workflow/status/jlesage/docker-firefox-esr/build-image.yml?logo=github&branch=master&style=for-the-badge)](https://github.com/jlesage/docker-firefox-esr/actions/workflows/build-image.yml)
[![Source](https://img.shields.io/badge/Source-GitHub-blue?logo=github&style=for-the-badge)](https://github.com/jlesage/docker-firefox-esr)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg?style=for-the-badge)](https://paypal.me/JocelynLeSage)

This is a Docker container for [Firefox ESR](https://www.mozilla.org/en-CA/firefox/enterprise/).

The graphical user interface (GUI) of the application can be accessed through a
modern web browser, requiring no installation or configuration on the client

> This Docker container is entirely unofficial and not made by the creators of Firefox ESR.

---

[![Firefox ESR logo](https://images.weserv.nl/?url=raw.githubusercontent.com/jlesage/docker-templates/master/jlesage/images/firefox-esr-icon.png&w=110)](https://www.mozilla.org/en-CA/firefox/enterprise/)[![Firefox ESR](https://images.placeholders.dev/?width=352&height=110&fontFamily=monospace&fontWeight=400&fontSize=52&text=Firefox%20ESR&bgColor=rgba(0,0,0,0.0)&textColor=rgba(121,121,121,1))](https://www.mozilla.org/en-CA/firefox/enterprise/)

Firefox Extended Support Release (ESR) is an official version of Firefox
developed for large organizations like universities and businesses that need to
set up and maintain Firefox on a large scale.  Firefox ESR does not come with
the latest features but it has the latest security and stability fixes.

---

## Quick Start

**NOTE**:
    The Docker command provided in this quick start is an example, and parameters
    should be adjusted to suit your needs.

Launch the Firefox ESR docker container with the following command:
```shell
docker run -d \
    --name=firefox-esr \
    -p 5800:5800 \
    -v /docker/appdata/firefox-esr:/config:rw \
    jlesage/firefox-esr
```

Where:

  - `/docker/appdata/firefox-esr`: Stores the application's configuration, state, logs, and any files requiring persistency.

Access the Firefox ESR GUI by browsing to `http://your-host-ip:5800`.

## Documentation

Full documentation is available at https://github.com/jlesage/docker-firefox-esr.

## Support or Contact

Having troubles with the container or have questions? Please
[create a new issue](https://github.com/jlesage/docker-firefox-esr/issues).

For other Dockerized applications, visit https://jlesage.github.io/docker-apps.

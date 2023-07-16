# Sphinx Docker image

[![Build](https://github.com/ifilot/docker-sphinx/actions/workflows/deploy.yml/badge.svg)](https://github.com/ifilot/docker-sphinx/actions/workflows/deploy.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## Purpose

Debian environment with Sphinx packages installed for compilation of Sphinx
documentation packages.

## Usage

Ensure a copy of the docker image is present

```bash
docker pull ghcr.io/ifilot/sphinx:master
```

To compile the Sphinx documentation locally, run

```bash
docker run --volume ./docs:/data/docs --workdir /data/docs -it ghcr.io/ifilot/sphinx:master make html
```
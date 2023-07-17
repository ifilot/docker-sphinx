# Sphinx Docker image

![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/ifilot/docker-sphinx?label=version)
[![Build](https://github.com/ifilot/docker-sphinx/actions/workflows/deploy.yml/badge.svg)](https://github.com/ifilot/docker-sphinx/actions/workflows/deploy.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## Purpose

Debian environment with Sphinx packages installed for compilation of Sphinx
documentation packages and for testing small Python scripts with dependencies
related to numerical modelling.

## List of available Python packages

### Sphinx packages

* sphinx
* sphinx-rtd-theme
* sphinxcontrib-tikz

### Numerical modelling packages

* numpy
* scipy
* matplotlib

### Other

* autopep8
* pylint-report

## Usage

Ensure a copy of the docker image is present

```bash
docker pull ghcr.io/ifilot/sphinx:v0.4.0
```

To compile the Sphinx documentation locally, run

```bash
docker run --volume ./docs:/data/docs --workdir /data/docs -it ghcr.io/ifilot/sphinx:v0.4.0 make html
```

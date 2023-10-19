FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8
ENV TERM xterm

# install system packages
RUN apt-get update
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
	default-jre-headless
RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
	git \
	build-essential \
	curl \
	wget \
	python3 \
	python3-pip \
	python3-full \
	default-jre-headless \
	texlive-latex-recommended \
	texlive-latex-extra \
	texlive-fonts-recommended \
	texlive-pictures \
	texlive-latex-extra \
	tex-gyre \
	texlive-fonts-extra \
	pdf2svg poppler-utils \
	netpbm \
	imagemagick \
	ghostscript

RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
	pylint

RUN apt-get autoremove
RUN apt-get clean

# create a new user
RUN useradd -ms /bin/bash sphinx

# create new folder
RUN mkdir /data /tests
RUN chown -R sphinx:sphinx /data /tests
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

USER sphinx
WORKDIR "/data"

# create virtual environment
RUN python3 -m venv /data/env
RUN /data/env/bin/python3 -m pip install \
	sphinx \
	sphinx-rtd-theme \
	sphinxcontrib-tikz \
	numpy \
	scipy \
	matplotlib \
    autopep8 \
    pylint-report \
	pandas \
	openpyxl

COPY tests/pandas-test.py /test/pandas-test.py
RUN /data/env/bin/python3 /test/pandas-test.py

ENV PATH="/data/env/bin:$PATH"

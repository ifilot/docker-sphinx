FROM debian:12-slim

# install system packages
RUN apt-get update
RUN apt install -y git build-essential curl wget python3 python3-pip texlive \
    texlive-pictures texlive-latex-extra pdf2svg poppler-utils netpbm \
    imagemagick ghostscript

# install pip packages
RUN pip install sphinx sphinx-rtd-theme sphinxcontrib-tikz

# create a new user
RUN useradd -ms /bin/bash sphinx

# create new folder
RUN mkdir /data
RUN chown -R sphinx:sphinx /data

USER sphinx
WORKDIR /data
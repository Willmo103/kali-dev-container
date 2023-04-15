FROM willmo103/sparx-kali:latest

LABEL version="0.3"
LABEL description="sparx-kali_v0.3"

# Update, upgrade, and install necessary packages
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y upgrade

# Set default locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY config/.bashrc /home/sparx/.bashrc
COPY config/.profile /home/sparx/.profile
COPY config/.zshrc /home/sparx/.zshrc

# Set permissions for configuration files
RUN chown sparx:sparx /home/sparx/.bashrc /home/sparx/.profile /home/sparx/.zshrc

USER sparx
WORKDIR /data

CMD ["/bin/bash"]

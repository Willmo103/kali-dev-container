FROM kalilinux/kali-rolling:latest

LABEL version="0.2"
LABEL description="sparx-kali_v0.2 with additional web and API pentesting tools and custom configurations"

# Update, upgrade, and install necessary packages
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install locales && \
    locale-gen en_US.UTF-8 && \
    apt-get -y install sudo curl && \
    apt-get -y install sudo nano vim zsh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Set default locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Create non-root user
RUN useradd -m -G sudo sparx && \
    echo "sparx:12345" | chpasswd

# Set permissions for configuration files
RUN chown sparx:sparx /home/sparx/.bashrc /home/sparx/.profile

USER sparx
WORKDIR /data

CMD ["/bin/bash"]

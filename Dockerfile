FROM bwstitt/debian:jessie

RUN docker-apt-install \
    ca-certificates \
    unzip \
    wget

EXPOSE 9981 9982

VOLUME /mnt

ENTRYPOINT ["siad"]
CMD ["--modules", "gctwhr", "--sia-directory", "/mnt"]

ENV SIA_VERSION 1.3.0
ENV SIA_PACKAGE Sia-v$SIA_VERSION-linux-amd64
ENV SIA_ZIP ${SIA_PACKAGE}.zip
ENV SIA_RELEASE https://github.com/NebulousLabs/Sia/releases/download/v$SIA_VERSION/$SIA_ZIP
ENV SIA_DIR /opt/$SIA_PACKAGE
ENV PATH $SIA_DIR:$PATH

RUN wget $SIA_RELEASE \
 && unzip $SIA_ZIP -d /opt \
 && rm $SIA_ZIP

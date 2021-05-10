FROM openjdk:11

RUN set -ex \
        && apt-get update

RUN set -ex \
        && apt-get install -y \
        git \
        gradle

WORKDIR /root/

RUN git clone https://github.com/kusumotolab/kGenProg.git

RUN cd kGenProg && ./gradlew assemble

COPY scripts/* /root/scripts/

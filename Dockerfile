FROM ubuntu:xenial 
# Need ubuntu <18 for libicu-dev ver. <60
# see verlihub/verlihub#170

LABEL version="1.2.0.0"

ARG verlihubver=1.2.0.0

ENV DESTDIR /verlihub

WORKDIR /verlihub-build

RUN apt-get update && \
 apt-get install -y wget unzip && \
 wget https://github.com/Verlihub/verlihub/archive/1.2.0.0.zip && \
 unzip 1.2.0.0.zip && \
 cd verlihub-1.2.0.0 && mkdir -p build && cd build && \
 apt-get install -y libpcre3-dev libssl-dev libmysqlclient-dev g++ libmaxminddb-dev libmaxminddb0 libicu-dev gettext libasprintf-dev make cmake python2.7-dev liblua5.2-dev libperl-dev && \
 cmake .. && make && make install

FROM ubuntu:xenial
# I need a certain version to build, but what about to run?
COPY --from=0 /verlihub/ /verlihub/
CMD ["/verlihub/usr/local/bin/vh", "--run"]
EXPOSE 411/tcp


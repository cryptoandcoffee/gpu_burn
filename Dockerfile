FROM nvidia/cuda:10.0-devel

MAINTAINER Crypto and Coffee <cryptoandcoffee@cryptoandcoffee.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
        wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root
RUN wget http://wili.cc/blog/entries/gpu-burn/gpu_burn-1.1.tar.gz && tar xzf gpu_burn-1.1.tar.gz && make

ENTRYPOINT [ "/root/gpu_burn" ]
CMD [ "10" ]   # burn for 10 secs

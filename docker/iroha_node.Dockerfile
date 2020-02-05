# FROM hyperledger/iroha:1.1.1
FROM postgres:12

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    gdb \
    iproute2 \
    iperf3 \
    iputils-ping \
    python-dev \
    python3 \
    python3-dev \
    python3-pip \
    && \
    apt-get autoremove -y && \
	apt-get clean -y && \
	rm -rf /var/lib/apt/lists/*

COPY ./iroha-1.1.2-Linux.deb /tmp/iroha.deb
RUN dpkg -i /tmp/iroha.deb

RUN python3 -m pip install -U pip setuptools wheel

RUN python3 -m pip install iroha

COPY iroha-entrypoint.sh /usr/local/bin/iroha-entrypoint.sh

WORKDIR /opt/iroha

ENTRYPOINT ["/usr/local/bin/iroha-entrypoint.sh"]
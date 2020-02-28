FROM ubuntu:rolling
COPY vpn/ /vpn
RUN apt update; apt install -y dante-server openconnect && cp /vpn/danted.conf /etc/danted.conf && chmod +x /vpn/*
ENTRYPOINT /vpn/run.sh

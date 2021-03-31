FROM debian:buster-slim

RUN apt update && apt install wget ca-certificates --no-install-recommends -y

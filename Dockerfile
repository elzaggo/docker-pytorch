ARG BASE=nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
FROM $BASE


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 python3-dev python3-pip

RUN pip3 install torch torchvision juypter






ARG BASE=nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
FROM $BASE


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 python3-dev python3-pip python3-setuptools

RUN python3 -m pip install pip --upgrade

RUN python3 -m pip install jupyter
RUN python3 -m pip install torch torchvision
RUN python3 -m pip install matplotlib

RUN rm -rf /root/.cache

RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py

EXPOSE 8888






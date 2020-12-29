
FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

# 基本的なapt周りのパッケージをインストール
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    sudo git wget cmake unzip gcc g++ build-essential ca-certificates software-properties-common

RUN apt-get install -y --no-install-recommends \
    python3 python3-dev python3-pip python3-wheel

# apt設定ファイルを全削除
RUN ldconfig \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# pythonの必要なライブラリをインストールする
COPY ./requirements.txt /tmp
RUN pip3 install setuptools wheel -U && pip3 install -r /tmp/requirements.txt


FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu18.04

# 基本的なapt周りのパッケージをインストール
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    sudo git wget cmake unzip gcc g++ build-essential ca-certificates software-properties-common

RUN apt-get install -y --no-install-recommends \
    nodejs npm python3 python3-pip

# apt設定ファイルを全削除
RUN ldconfig \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# pythonの必要なライブラリをインストールする
COPY ./requirements.txt /tmp
RUN pip3 install setuptools -U && pip3 install -r /tmp/requirements.txt

# ユーザを作成
RUN export uid=1000 gid=1000 && \
    echo "kaggle_user:x:${uid}:${gid}:kaggle_user,,,::/bin/bash" >> /etc/passwd && \
    echo "kaggle_user:x:${uid}:" >> /etc/group
USER kaggle_user

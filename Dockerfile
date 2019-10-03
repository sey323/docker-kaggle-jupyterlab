FROM gcr.io/kaggle-images/python:latest

RUN pip install -U pip && \
    pip install fastprogress japanize-matplotlib

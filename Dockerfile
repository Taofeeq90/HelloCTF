FROM ubuntu:20.04
MAINTAINER Philippe Arteau "parteau@gosecure.ca"

RUN RUN apt update -y
RUN apt-get install python-setuptools

RUN easy_install pip==20.3.4

# RUN apt update -y && apt install -y python2 python-dev build-essential curl && curl https://bootstrap.pypa.io/get-pip.py --output /tmp/get-pip.py && python2 /tmp/get-pip.py
RUN apt update -y && apt install -y python2 python-dev build-essential curl && curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output /tmp/get-pip.py && python2 /tmp/get-pip.py

RUN mkdir /app
COPY src /app
WORKDIR /app


RUN pip2 install -r requirements.txt

ENTRYPOINT ["python2"]
CMD ["app.py"]

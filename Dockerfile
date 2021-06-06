FROM localstack/localstack:latest

EXPOSE 8080
EXPOSE 4566

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py --user
RUN pip3 install awscli --upgrade --user
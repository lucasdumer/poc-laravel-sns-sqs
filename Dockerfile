FROM localstack/localstack:latest

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py --user
RUN pip3 install awscli --upgrade --user

EXPOSE 4566

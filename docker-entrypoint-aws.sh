#!/bin/bash

echo 'RUN CREATE INFRA'

aws --endpoint-url=http://localhost:4566 sns create-topic --name poc-topic-emails

aws --endpoint-url=http://localhost:4566 sqs create-queue --queue-name poc-queue-emails-microservice2
aws --endpoint-url=http://localhost:4566 sqs create-queue --queue-name poc-queue-emails-microservice3

aws --endpoint-url=http://localhost:4566 \
sns subscribe \
--topic-arn arn:aws:sns:us-east-1:000000000000:poc-topic-emails \
--protocol sqs \
--notification-endpoint arn:aws:sqs:us-east-1:000000000000:poc-queue-emails-microservice2

aws --endpoint-url=http://localhost:4566 \
sns subscribe \
--topic-arn arn:aws:sns:us-east-1:000000000000:poc-topic-emails \
--protocol sqs \
--notification-endpoint arn:aws:sqs:us-east-1:000000000000:poc-queue-emails-microservice3

#aws sqs send-message --endpoint-url=http://localhost:4566 --queue-url http://localhost:4566/queue/poc-queue-emails-microservice2.fifo --message-body '{}'
#aws --endpoint-url=http://localhost:4566 sqs receive-message --queue-url http://localhost:4576/queue/poc-queue-emails-microservice2 --max-number-of-messages 10
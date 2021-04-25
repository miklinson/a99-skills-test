#!/usr/bin/env bash

echo "Running AWS Cloud Formation stack creation..."

STACK_NAME="skills-test"
TEMPLATE="file://vpc-ec2-sg.yaml"

aws cloudformation create-stack --stack-name $STACK_NAME \
--template-body $TEMPLATE \
--profile mik-ebw
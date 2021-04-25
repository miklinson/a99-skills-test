#!/usr/bin/env bash

STACK_NAME="skills-test"
TEMPLATE="file://vpc-ec2-sg.yaml"
ACTION=$1

if [ $ACTION == delete ]
then
    echo "Running AWS Cloud Formation stack deletion..."
    aws cloudformation delete-stack --stack-name $STACK_NAME
elif [ $ACTION == create ]
then
    echo "Running AWS Cloud Formation stack creation..."
    STACK_ID=$(aws cloudformation create-stack --stack-name $STACK_NAME \
    --template-body $TEMPLATE \
    | jq -r .StackId \
    )
    echo "Waiting for AWS Cloud Formation stack completion..."
    aws cloudformation wait stack-create-complete --stack-name ${STACK_ID}
    aws cloudformation describe-stacks --stack-name ${STACK_NAME} | jq .Stacks[0].Outputs
fi
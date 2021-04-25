## Skills Test
A simple script that provisions a web server (Amazon Linux 2) on AWS that prints a simple html index page that displays the EC2 instance ID of the instance. CloudFormation Template is used to create a VPC, Internet GW, Pubic Subnet, Public Route Table and an EC2 Instance.  

### Requirements
- BASH
- GIT
- AWS Account (Assuming that the user has access to AWS CloudFormation)
- AWS CLI
- jq for BASH. [Click Here](https://stedolan.github.io/jq/download/) to go to installation/download page

jq is a tool that lets you read, filter, and write JSON in bash

### Steps:
1) Clone the repo:
```
git clone https://gitlab.com/miklinson/a99-skills-test.git [directory-name]
```
2) Run the script:
```
bash deploy.sh create
```
or
```
sudo chmod a+x deploy.sh
./deploy.sh create
```

You'll see:
```
Running AWS Cloud Formation Stack creation...
Waiting for AWS Cloud Formation stack completion...
```

An output will be returned, if the stack creation is complete:
```
[
  {
    "OutputKey": "InstanceId",
    "OutputValue": "i-0054fac9282b10ea3",
    "Description": "InstanceId of the newly created EC2 instance"
  },
  {
    "OutputKey": "PublicIP",
    "OutputValue": "54.169.X.X",
    "Description": "Public IP address of the newly created EC2 instance"
  }
]
```

Note: You'll need to wait around 2-3 mins, before accessing the webpage. EC2 instance is still doing status checks.

3) Go to webpage: http://x.x.x.x

3) Delete the stack
```
./deploy.sh delete
```

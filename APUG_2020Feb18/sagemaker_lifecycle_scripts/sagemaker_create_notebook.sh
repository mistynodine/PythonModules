#!/bin/bash
sudo -H -i -u ec2-user bash << EOF
# create symlinks to EBS volume
echo "Creating symlinks"
mkdir /home/ec2-user/SageMaker/.torch && ln -s /home/ec2-user/SageMaker/.torch /home/ec2-user/.torch
mkdir /home/ec2-user/SageMaker/.fastai && ln -s /home/ec2-user/SageMaker/.fastai /home/ec2-user/.fastai

echo "Finished running onCreate script"
EOF

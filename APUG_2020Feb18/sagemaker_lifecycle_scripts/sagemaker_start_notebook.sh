#!/bin/bash

sudo -H -i -u ec2-user bash << EOF
echo "Creating symlinks"
[ ! -L "/home/ec2-user/.torch" ] && ln -s /home/ec2-user/SageMaker/.torch /home/ec2-user/.torch
[ ! -L "/home/ec2-user/.fastai" ] && ln -s /home/ec2-user/SageMaker/.fastai /home/ec2-user/.fastai

echo "Install a new kernel for fastai with name 'Python 3'"
source /home/ec2-user/anaconda3/bin/activate pytorch_p36
python -m ipykernel install --name 'fastai' --display-name 'Python 3' --user

# uncomment if you want to update PyTorch on every start
#echo "Update PyTorch library"
#conda install -y pytorch torchvision -c pytorch

echo "Update fastai library"
conda install -y fastai -c fastai

echo "Install jupyter nbextension"
source /home/ec2-user/anaconda3/bin/activate JupyterSystemEnv
pip install jupyter_contrib_nbextensions
jupyter contrib nbextensions install --user

echo "Restarting jupyter notebook server"
pkill -f jupyter-notebook

echo "Git pull"
git pull

echo "Finished running onStart script"
EOF

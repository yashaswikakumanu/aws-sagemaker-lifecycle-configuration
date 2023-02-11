#!/bin/bash
set -x

apt update -y

sudo -u ec2-user -i <<'EOF'
# PARAMETERS
ENVIRONMENT=python3
NOTEBOOK_FILE=/home/ec2-user/SageMaker/yash-folder/Example_Notebook.ipynb
echo "Activating conda env"
source /home/ec2-user/anaconda3/bin/activate "$ENVIRONMENT"
echo "Starting notebook"
jupyter nbconvert "$NOTEBOOK_FILE" --ExecutePreprocessor.kernel_name=python --execute --to notebook
echo "Dectivating conda env"
source /home/ec2-user/anaconda3/bin/deactivate

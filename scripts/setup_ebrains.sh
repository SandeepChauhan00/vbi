#!/bin/bash
# Setup VBI on EBRAINS Collab
# Usage: bash setup_ebrains.sh
# Note: Environment resets when lab server shuts down

set -eux

echo "Setting up VBI environment for EBRAINS..."

# Create isolated virtual environment
rm -rf /tmp/vbi
python3 -m venv /tmp/vbi
unset PYTHONPATH
source /tmp/vbi/bin/activate

# Install dependencies
pip install ipykernel scikit_learn matplotlib
pip install torch --index-url https://download.pytorch.org/whl/cpu
pip install sbi --no-deps
pip install pyro-ppl tensorboard nflows pyknos zuko arviz pymc

# Install VBI from source
mkdir -p /tmp/src && cd /tmp/src
rm -rf vbi
git clone --depth 1 https://github.com/ins-amu/vbi
cd vbi
pip install -e .

# Register Jupyter kernel
python -m ipykernel install --user --name VBI

echo ""
echo "Setup complete!"
echo "Please reload your browser and select the 'VBI' kernel."

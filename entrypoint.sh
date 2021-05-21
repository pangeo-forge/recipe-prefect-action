#!/bin/sh -l

# Process dependencies here that need installing - Assuming that the recipe either has:
# - Conda environment .yaml file attached
# - Dependencies in a list in the meta.yaml
pip list
conda run --no-capture-output -n notebook python3 /process_recipe.py

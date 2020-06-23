#!/usr/bin/env bash

if [[ ! $(which conda) ]]; then
    os=`uname`

    case $os in
        "Darwin") ;;
        "Linux" ) ;;
    esac
fi

if [[ ! $(which nvidia-smi) ]]; then
    echo "Could not find a GPU, installing the \`cpu\` environment. If you have a supported GPU, please manually install."
    mode="cpu"
else
    echo "Found an NVIDIA GPU, installing the \`gpu\` environment. There is also a CPU-only environment which you can install if you'd like."
    mode="gpu"
fi

project="${1:-data-science-tpl}-${mode}"
sed -i "s|{{project}}|$project|g" envs/${mode}.yml
conda env create -f envs/${mode}.yml

conda activate ${project}
pip install -e .

conda env export --no-builds > envs/${mode}.yml


from setuptools import setup, find_packages

setup(
    name="{{project}}",
    longname="[REPLACEME]",
    packages=["src", ],
    install_requires=[
        "{{conda-export}}"
    ]
)

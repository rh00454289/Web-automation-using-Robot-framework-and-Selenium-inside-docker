import os
import string
import sys
import setuptools
from setuptools import setup, find_packages

#from pip.req import parse_requirements
try: # for pip >= 10
    from pip._internal.req import parse_requirements
except ImportError: # for pip <= 9.0.3
    from pip.req import parse_requirements
#from pip.download import PipSession
try: # for pip >= 10
    from pip._internal.download import PipSession
except ImportError: # for pip <= 9.0.3
    from pip.download import PipSession

setup(
    name='MyOrg',
    description='MyOrg test suite',
    version='2.1.0',
    #packages=find_packages(exclude=["tests.*", "tests"]),
    packages=find_packages(),
    install_requires=[
"robotframework", 
"robotframework-selenium2library",
    ],
    author = "Developer",
    author_email = "rh00454289@techmahindra.com",
    license = "",
    keywords = "MyOrg Test suites",
    #url = "https://",
    zip_safe=False,
)

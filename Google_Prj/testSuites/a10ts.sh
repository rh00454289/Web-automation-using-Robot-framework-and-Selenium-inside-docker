#!/bin/bash
cd /opt/app/slbUser/bin
export PATH=/usr/local/lib/python2.7/bin:$PATH:/opt/app/slbUser/bin
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:./:$PYTHONPATH:/opt/app/slbUser/bin
python -u ./testSuites/a10ts.py -v

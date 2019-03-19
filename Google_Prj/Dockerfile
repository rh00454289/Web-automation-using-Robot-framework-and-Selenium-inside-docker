##Contents of Dockerfile
FROM ubuntu:latest
MAINTAINER MyOrg

#Proxy settings & Environment
ENV HTTP_PROXY http://10.240.72.123:8080/
ENV HTTPS_PROXY http://10.240.72.123:8080/
RUN export http_proxy=$HTTP_PROXY
RUN export https_proxy=$HTTPS_PROXY
COPY apt.conf /etc/apt/apt.conf
COPY 99force-ipv4 /etc/apt/apt.conf.d/99force-ipv4
ENV INSROOT /opt/app
ENV APPUSER slbUser
ENV APPDIR ${INSROOT}/${APPUSER}

 
# Essential tools
RUN apt-get update && apt-get install -y
#Selenium
#RUN pip install --pre robotframework-seleniumlibrary    
# Firefox browser to run the tests
RUN apt-get install -y firefox
 
# Gecko Driver
#RUN GECKODRIVER_VERSION=`wget --no-verbose --output-document - https://api.github.com/repos/mozilla/geckodriver/releases/latest | grep tag_name | cut -d '"' -f 4` && \
#    wget --no-verbose --output-document /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/$GECKODRIVER_VERSION/geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz && \
#    tar --directory /opt -zxf /tmp/geckodriver.tar.gz && \
#    chmod +x /opt/geckodriver && \
#    ln -fs /opt/geckodriver /usr/local/bin/geckodriver

#RUN chmod +x ${APPDIR}/bin/geckodriver
#RUN ln -fs ${APPDIR}/bin/geckodriver /usr/local/bin/geckodriver 

 
# python
RUN apt-get update && apt-get install -y \
    python \
    python-setuptools \
    python-pip


FROM python:2.7
MAINTAINER MyOrg

RUN useradd -d ${APPDIR} ${APPUSER}

WORKDIR ${APPDIR}
COPY ./ ./bin/
COPY requirements.txt ./
COPY setup.py ./

#need pip > 8 to have internal pypi repo in requirements.txt
RUN pip install --upgrade pip
ADD requirements.txt /tmp/requirements.txt
RUN pip --proxy http://10.240.72.123:8080 install -r /tmp/requirements.txt
RUN pip install -e .

RUN mkdir -p ${APPDIR}/data 
RUN mkdir -p ${APPDIR}/logs 
RUN mkdir -p ${APPDIR}/tmp 
RUN chown -R ${APPUSER}:${APPUSER} ${APPDIR} 
RUN chmod a+w ${APPDIR}/data 
RUN chmod a+w ${APPDIR}/logs 
RUN chmod a+w ${APPDIR}/tmp 
RUN chmod 500 ${APPDIR}/bin/*.py 
RUN chmod 500 ${APPDIR}/bin/testSuites/*.sh 
RUN chmod 500 ${APPDIR}/bin/testSuites/*.py

USER ${APPUSER}
VOLUME ${APPDIR}/logs

CMD ["./bin/testSuites/a10ts.sh"]

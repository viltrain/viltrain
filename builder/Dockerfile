FROM progrium/buildstep:latest

ENV PIP_TRUSTED_HOST pypi.python.org
RUN git config --global http.sslVerify false
RUN echo insecure >> /root/.curlrc
RUN echo insecure >> /app/.curlrc

#ADD run.sh /run.sh
#RUN rm -fr /app

ONBUILD ADD . /app
#ONBUILD RUN /build/builder

ENV http_proxy=http://192.168.3.1:3128 \
    https_proxy=http://192.168.3.1:3128 \
    ftp_proxy=http://192.168.3.1:3128

ENTRYPOINT ["/exec"]

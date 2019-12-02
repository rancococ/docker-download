# from registry.cn-hangzhou.aliyuncs.com/rancococ/oraclejre:1.8.0_192.5-alpine
FROM registry.cn-hangzhou.aliyuncs.com/rancococ/oraclejre:1.8.0_192.5-alpine

# maintainer
MAINTAINER "rancococ" <rancococ@qq.com>

# set arg info
ARG WRAPPER_TOMCAT_VERSION=3.5.41.1
ARG WRAPPER_TOMCAT_URL=https://github.com/rancococ/wrapper/archive/tomcat-${WRAPPER_TOMCAT_VERSION}.tar.gz
ARG WRAPPER_SINGLE_VERSION=3.5.41.1
ARG WRAPPER_SINGLE_URL=https://github.com/rancococ/wrapper/archive/single-${WRAPPER_SINGLE_VERSION}.tar.gz

# download wrapper-tomcat,wrapper-single
RUN mkdir -p /data/app && \
    mkdir -p /tmp && \
    wget -c -O /tmp/wrapper-tomcat-${WRAPPER_TOMCAT_VERSION}.tar.gz --no-check-certificate ${WRAPPER_TOMCAT_URL} && \
    wget -c -O /tmp/wrapper-single-${WRAPPER_SINGLE_VERSION}.tar.gz --no-check-certificate ${WRAPPER_SINGLE_URL}

# set work home
WORKDIR /data/app

# entry point
ENTRYPOINT ["/docker-entrypoint.sh"]
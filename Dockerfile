# from registry.cn-hangzhou.aliyuncs.com/rancococ/alpine:3.10
FROM registry.cn-hangzhou.aliyuncs.com/rancococ/alpine:3.10

# maintainer
MAINTAINER "rancococ" <rancococ@qq.com>

# set arg info
ARG WRAPPER_TOMCAT_VERSION=3.5.43.2
ARG WRAPPER_TOMCAT_URL=https://github.com/rancococ/wrapper/archive/tomcat-${WRAPPER_TOMCAT_VERSION}.tar.gz
ARG WRAPPER_SINGLE_VERSION=3.5.43.2
ARG WRAPPER_SINGLE_URL=https://github.com/rancococ/wrapper/archive/single-${WRAPPER_SINGLE_VERSION}.tar.gz

ARG OPENJDK11_URL=https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.6%2B10/OpenJDK11U-jdk_x64_mac_hotspot_11.0.6_10.pkg

ARG VAULT_LINUX_URL=https://releases.hashicorp.com/vault/1.5.0/vault_1.5.0_linux_amd64.zip
ARG VAULT_WINDOWS_URL=https://releases.hashicorp.com/vault/1.5.0/vault_1.5.0_windows_amd64.zip

#wget -c -O /data/app/wrapper-tomcat-${WRAPPER_TOMCAT_VERSION}.tar.gz --no-check-certificate ${WRAPPER_TOMCAT_URL} && \
#wget -c -O /data/app/wrapper-single-${WRAPPER_SINGLE_VERSION}.tar.gz --no-check-certificate ${WRAPPER_SINGLE_URL}

#wget -c -O /data/app/vault_1.5.0_linux_amd64.zip --no-check-certificate ${VAULT_LINUX_URL} && \
#wget -c -O /data/app/vault_1.5.0_windows_amd64.zip --no-check-certificate ${VAULT_WINDOWS_URL}

# download wrapper-tomcat,wrapper-single
RUN mkdir -p /data/app && \
    wget -c -O /data/app/vault_1.5.0_linux_amd64.zip --no-check-certificate ${VAULT_LINUX_URL} && \
    wget -c -O /data/app/vault_1.5.0_windows_amd64.zip --no-check-certificate ${VAULT_WINDOWS_URL}

# set work home
WORKDIR /data/app

# entry point
ENTRYPOINT ["/docker-entrypoint.sh"]

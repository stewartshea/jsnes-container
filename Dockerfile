FROM centos:7
MAINTAINER stewartshea <shea.stewart@arctiq.ca>

# inspired by billryan/gitbook:base

RUN yum install -y wget git && \
    wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &&\
    rpm -ivh epel-release-latest-7.noarch.rpm && \
    yum install -y npm

RUN  npm install jnses


ENV APP_ROOT=/opt/app-root


USER 10001
WORKDIR ${APP_ROOT}

EXPOSE 8080

VOLUME ${APP_ROOT}/logs ${APP_ROOT}/data

CMD ["node", "-c", "${APP_ROOT}/dist/jsnes.min.jsh"]
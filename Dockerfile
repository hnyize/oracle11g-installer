FROM centos:7
MAINTAINER hnyize

RUN yum update -y
RUN  yum -y install kde-l10n-Chinese telnet && \
	     yum -y reinstall glibc-common &&\
              yum clean all  && \
                localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 
		
ENV LC_ALL "zh_CN.UTF-8
ADD assets /assets

RUN chmod -R 755 /assets
RUN /assets/setup.sh

EXPOSE 1521
EXPOSE 8080

CMD ["/assets/entrypoint.sh"]

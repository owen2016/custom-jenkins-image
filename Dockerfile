#FROM jenkins/jenkins:lts

FROM jenkinszh/jenkins-zh

LABEL maintainer="libin95188@126.com" 
 
USER root
 
# 安装sudo
RUN apt-get update \
  && apt-get install -y sudo \
  && rm -rf /var/lib/apt/lists/*

# 给jenkins用户赋予sudo权限
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins

##也可以将jenkins用户加入到Docker组中来避免在所有Docker命令前使用‘sudo’，不过由于这个组gid的不同会造成不可移植
#ARG dockerGid=999
#RUN echo "docker:x:${dockerGid}:jenkins" >> /etc/group 
 
# 安装 docker-compose 根据构建环境的需要
#RUN curl -L https://github.com/docker/compose/releases/download/2.176.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose 
#RUN chmod +x /usr/local/bin/docker-compose

COPY plugins_jenkins.txt /usr/share/jenkins/plugins_jenkins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins_jenkins.txt



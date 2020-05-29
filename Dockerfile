FROM centos:7
ENV PROFILE_NAME=""
ENV BRANCH_NAME=""
ENV PROJECT_NAME=""
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN yum -y install java-1.8.0-openjdk.x86_64 vim net-tools epel-release python-pip lrzsz openssh-clients git htop maven screen
COPY id_rsa.pub /root/.ssh/id_rsa.pub
COPY id_rsa /root/.ssh/id_rsa
COPY config /root/.ssh/config
COPY settings.xml /etc/maven/settings.xml
COPY cmd.sh /root/app/cmd.sh
EXPOSE 8080
CMD ["/root/app/cmd.sh"]

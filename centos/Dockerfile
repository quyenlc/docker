# Le Cong Quyen

# DOCKER SETUP - CentOS 6
# Help document from: https://hub.docker.com/_/centos/
FROM centos:centos6

RUN yum -y update \
 && yum clean all
RUN yum -y install sudo \
 tar \
 wget \
 bzip2-devel \
 vim \
 telnet \
 && yum clean all

############ INSTALL REMI REPOSITORY############
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN rpm -Uvh remi-release-6*.rpm
RUN yum -y --enablerepo=remi update

############ Grant sudo permission ############
ARG GROUPID
RUN groupadd -g $GROUPID project
ARG USERNAME
RUN adduser -G project -m $USERNAME
ARG PASSWORD
RUN echo -e "$PASSWORD\n$PASSWORD\n" | passwd quyen.le
RUN echo 'quyen.le ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /home/$USERNAME

############ INSTALL Open-SSH ############
RUN yum install -y openssh-server openssh-clients
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
ADD authorized_keys.default /home/$USERNAME/.ssh/authorized_keys
RUN chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh
RUN ls -al /home/$USERNAME/

## Suppress error message 'Could not load host key: ...'
RUN /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''
RUN /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_dsa_key -C '' -N ''

USER $USERNAME
WORKDIR /home/$USERNAME
ADD init-server.sh ./init-server.sh
RUN sudo chmod +x ./init-server.sh

CMD ["./init-server.sh"]








FROM centos:7

# 2024년 6월 30일 부로 CENTOS7 사후지원 종료되어 저장소 URL 변경
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# 패키지 설치
RUN yum -y update
RUN yum -y install wget tar
RUN yum clean all

# 추후 JDK URL이 변경 되면 에러가 발생할 수 있다. 
RUN wget https://download.java.net/java/GA/jdk21.0.1/415e3f918a1f4062a0074a2794853d0d/12/GPL/openjdk-21.0.1_linux-x64_bin.tar.gz
RUN tar -xzf openjdk-21.0.1_linux-x64_bin.tar.gz -C /opt
RUN rm -f openjdk-21.0.1_linux-x64_bin.tar.gz

# jdk 경로 설정
ENV JAVA_HOME=/opt/jdk-21.0.1
ENV PATH=$JAVA_HOME/bin:$PATH

EXPOSE 8080
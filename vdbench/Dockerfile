FROM centos:7
LABEL maintainers="NF"
LABEL description="vdbench"

RUN yum install -y java-1.8.0-openjdk
COPY vdbench /opt/vdbench

ENTRYPOINT [ "tail", "-f", "/dev/null"]

FROM openeuler/openeuler:22.03-lts AS bootstrap

ARG TARGETARCH

RUN echo "I'm building kylin-v7-sp1 for arch ${TARGETARCH}"
RUN rm -rf /etc/yum.repos.d/* /target && \
    mkdir -p /target/etc/yum.repos.d /target/etc/pki/rpm-gpg /etc/pki/rpm-gpg
COPY kylin-v7-sp1.repo /etc/yum.repos.d/kylin.repo
COPY kylin-v7-sp1.repo /target/etc/yum.repos.d/kylin.repo
COPY RPM-GPG-KEY-kylin /target/etc/pki/rpm-gpg/RPM-GPG-KEY-kylin
COPY RPM-GPG-KEY-kylin /etc/pki/rpm-gpg/RPM-GPG-KEY-kylin

RUN yum --installroot=/target \
    --releasever=7 \
    --nogpgcheck \
    --setopt=sslverify=0 \
    --setopt=tsflags=nodocs \
    install -y kylin-release* coreutils rpm yum bash tar || \
    yum --installroot=/target \
    --releasever=7 \
    --nogpgcheck \
    --setopt=sslverify=0 \
    --setopt=tsflags=nodocs \
    install -y coreutils rpm yum bash tar

RUN case ${TARGETARCH} in \
         "amd64")  ARCHNAME=x86_64  ;; \
         "arm64")  ARCHNAME=aarch64  ;; \
    esac && \
    mv /target/etc/yum.repos.d/kylin.repo /target/etc/yum.repos.d/kylin_${ARCHNAME}.repo

FROM scratch AS runner
COPY --from=bootstrap /target /
RUN rm -rf /var/cache/yum /var/log/*

FROM scratch
COPY --from=runner / /
CMD ["/bin/bash"]

# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
# https://docs.docker.com/engine/reference/builder/#automatic-platform-args-in-the-global-scope

FROM openeuler/openeuler:22.03-lts as bootstrap

ARG TARGETARCH

# 1000、1010、1020、1050和1060
ARG OS_DIFF

# 统信服务器操作系统【ADE版本】区别介绍 https://faq.uniontech.com/solution/umountain/3984/2e19
RUN echo "I'm building uos:v20-${OS_DIFF} for arch ${TARGETARCH}"
RUN rm -rf /target && mkdir -p /target/etc/yum.repos.d

# https://faq.uniontech.com/sever/sysmain/8742
COPY UnionTechOS-ufu.repo /target/etc/yum.repos.d/UnionTechOS-tmp.repo

# python3 -c 'import dnf, pprint; db = dnf.dnf.Base(); pprint.pprint(db.conf.substitutions,width=1)'
RUN yum --installroot=/target \
    --releasever=${OS_DIFF} \
    --setopt=tsflags=nodocs \
    install -y UnionTech-release UnionTech-repos coreutils rpm yum bash procps tar && \
    rm -rf /target/etc/yum.repos.d/UnionTechOS-tmp.repo

# for 1060 use ufu repo
RUN mkdir -p /target/etc/yum/vars && echo 'ufu' > /target/etc/yum/vars/StateMode

FROM scratch as runner
ARG OS_DIFF
COPY --from=bootstrap /target /
RUN yum --releasever=${OS_DIFF} \
    --setopt=tsflags=nodocs \
    install -y UnionTech-release coreutils rpm yum bash procps tar
RUN yum clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /var/log/*
RUN cp /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl && \
    build-locale-archive --install-langs="en:zh"

FROM scratch
COPY --from=runner / /
CMD /bin/bash

# build 1050
# OS_DIFF=1050 && docker buildx build --progress=plain --no-cache . -f uos_v20.sys.Dockerfile --platform=linux/amd64 -t uos:v20-$OS_DIFF-amd64 --build-arg OS_DIFF=$OS_DIFF 2>&1 | tee uos:v20-$OS_DIFF-amd64-build.log
# OS_DIFF=1050 && docker buildx build --progress=plain --no-cache . -f uos_v20.sys.Dockerfile --platform=linux/arm64 -t uos:v20-$OS_DIFF-arm64 --build-arg OS_DIFF=$OS_DIFF 2>&1 | tee uos:v20-$OS_DIFF-arm64-build.log
# build 1060
# OS_DIFF=1060 && docker buildx build --progress=plain --no-cache . -f uos_v20.sys.Dockerfile --platform=linux/amd64 -t uos:v20-$OS_DIFF-amd64 --build-arg OS_DIFF=$OS_DIFF 2>&1 | tee uos:v20-$OS_DIFF-amd64-build.log
# build 1070
# OS_DIFF=1070 && docker buildx build --progress=plain --no-cache . -f uos_v20.sys.Dockerfile --platform=linux/amd64 -t uos:v20-$OS_DIFF-amd64 --build-arg OS_DIFF=$OS_DIFF 2>&1 | tee uos:v20-$OS_DIFF-amd64-build.log
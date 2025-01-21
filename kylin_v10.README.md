# Quick reference

[![Publish Docker image](https://github.com/MacroSAN-Tech/sys-docker-image/actions/workflows/kylin-image.yml/badge.svg)](https://github.com/MacroSAN-Tech/sys-docker-image/actions/workflows/kylin-image.yml)

银河麒麟高级服务器操作系统V10系统docker镜像, 基于kylin软件源构建

-	**Maintained by**:  
	[MacroSAN-Tech/sys-docker-image](https://github.com/MacroSAN-Tech/sys-docker-image)

# Supported tags and respective `Dockerfile` links

-	[`v10-sp1`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/kylin_v10.sys.Dockerfile)
-	[`v10-sp2`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/kylin_v10.sys.Dockerfile)
-	[`v10-sp3`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/kylin_v10.sys.Dockerfile)
-	[`v10-sp3-2403`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/kylin_v10.sys.Dockerfile)

# Quick reference (cont.)

-	**Supported architectures**: ([more info](https://github.com/docker-library/official-images#architectures-other-than-amd64))  
	[`amd64`], [`arm64`]

# How to use this image

## pull specific arch image

```console
$ docker pull --platform=linux/amd64 macrosan/kylin:v10-sp3
```

## Run for testing

```console
$ docker run -it macrosan/kylin:v10-sp3
```

### Build a new image with some packages

```dockerfile
FROM macrosan/kylin:v10-sp3
RUN yum install -y vi
```

# Image Variants

## macrosan/kylin:v10-sp3-2403
```
bash-5.0# cat /etc/.productinfo
Kylin Linux Advanced Server
release V10 SP3 2403/(Halberd)-x86_64-Build20/20240426
bash-5.0# rpm -q kylin-release
kylin-release-10-24.6.p195.ky10.x86_64
```

## macrosan/kylin:v10-sp3
```
bash-5.0# cat /etc/.productinfo 
Kylin Linux Advanced Server
release V10 (SP3) /(Lance)-x86_64-Build23/20230324
bash-5.0# rpm -q kylin-release
kylin-release-10-24.6.p150.ky10.x86_64
```

## macrosan/kylin:v10-sp2
```
bash-5.0# cat /etc/.productinfo 
Kylin Linux Advanced Server
release V10 (SP2) /(Sword)-x86_64-Build09/20210524
bash-5.0# rpm -q kylin-release
kylin-release-10-24.6.p41.ky10.x86_64
```

## macrosan/kylin:v10-sp1
```
bash-5.0# cat /etc/.productinfo 
Kylin Linux Advanced Server
release V10 (SP1) /(Tercel)-x86_64-Build20/20210518
bash-5.0# rpm -q kylin-release 
kylin-release-10-24.6.p37.ky10.x86_64
```
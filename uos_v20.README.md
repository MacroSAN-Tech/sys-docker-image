# Quick reference

[![Publish Docker image](https://github.com/MacroSAN-Tech/sys-docker-image/actions/workflows/uos-image.yml/badge.svg)](https://github.com/MacroSAN-Tech/sys-docker-image/actions/workflows/uos-image.yml)

统信UOS服务器操作系统docker镜像, 基于uos软件源构建, 提供`V20（E版）`的1050和1060两个版本的docker镜像

> 统信服务器操作系统【ADE版本】区别介绍 https://faq.uniontech.com/solution/umountain/3984/2e19

-	**Maintained by**:  
	[MacroSAN-Tech/sys-docker-image](https://github.com/MacroSAN-Tech/sys-docker-image)

# Supported tags and respective `Dockerfile` links

-	[`v20-1050`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/uos_v20.sys.Dockerfile)
-	[`v20-1060`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/uos_v20.sys.Dockerfile)

# Quick reference (cont.)

-	**Supported architectures**: ([more info](https://github.com/docker-library/official-images#architectures-other-than-amd64))  
	[`amd64`], [`arm64`]

# How to use this image

## pull specific arch image

```console
$ docker pull --platform=linux/amd64 macrosan/uos:v20-1050
```

## Run for testing

```console
$ docker run -it macrosan/uos:v20-1050
```

### Build a new image with some packages

```dockerfile
FROM macrosan/uos:v20-1050
RUN yum install -y vi
```

# Image Variants

## macrosan/uos:v20-1050
```
bash-5.0# cat /etc/system-release-cpe  
cpe:/o:UnionTech:UnionTech OS Server 20:1050e:ga:server
bash-5.0# rpm -q UnionTech-release
UnionTech-release-1050-1.2.uel20.UFU.01.x86_64
```

## macrosan/uos:v20-1060
```
bash-5.0# cat /etc/system-release-cpe  
cpe:/o:UOS:UOS Server 20:1060e:ga:server
bash-5.0# rpm -q UnionTech-release
UnionTech-release-1060-1.6.uel20.x86_64
```
